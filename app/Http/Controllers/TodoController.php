<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use App\Models\User;
use Illuminate\Http\Request;

class TodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        //
	$user = User::with('roles')->find( auth()->user()->id);
        $sortDesc = true;
        $sortBy = "";
        $tag = isset($_GET['tag'])?$_GET['tag']:"";
        $sortByParam = isset($_GET['sortBy'])?$_GET['sortBy']:"latest";
        $filter = isset($_GET['filter'])?$_GET['filter']:"";

        if($sortByParam === 'title-asc') {
            $sortDesc = false;
            $sortBy='title';
        }
        else if ($sortByParam === 'title-desc') $sortBy = 'title';
        else if ($sortByParam === 'assignee') {
            $sortDesc = false;
            $sortBy = 'assignee';
        }
        else if ($sortByParam === 'due-date') {
            $sortDesc = false;
            $sortBy = 'due_date';
        } else{
            $sortBy = isset($_GET['sortBy'])?$_GET['sortBy']:"id";
        }

        // ------------------------------------------------
        // Filtering
        // ------------------------------------------------
        $queryLowered = strtolower(isset($_GET['q'])&&$_GET['q']!="+"?$_GET['q']:"");
        if($user->roles[0]->name == 'staff')
            $filteredData = Todo::where('title', 'Like', $queryLowered=""?"%":'%'.$queryLowered.'%')->where('tags', 'Like', $tag=""?"%":'%'.$tag.'%')->where('status', 'Like', $filter=""?"%":'%'.$filter.'%')->where('assignee', 'Like', '%'.$user->id.'%')->orderBy($sortBy, $sortDesc?"DESC":"ASC")->get();
        else
            $filteredData = Todo::where('title', 'Like', $queryLowered=""?"%":'%'.$queryLowered.'%')->where('tags', 'Like', $tag=""?"%":'%'.$tag.'%')->where('status', 'Like', $filter=""?"%":'%'.$filter.'%')->orderBy($sortBy, $sortDesc?"DESC":"ASC")->get();
        return response()->json($filteredData, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $config = json_decode(file_get_contents('php://input'));
        try{
            $todo = new Todo;
            $todo->user_id=auth('sanctum')->user()->id;
            $todo->title = $config->task->title;
            $time = strtotime($config->task->dueDate);
            $newformat = date('Y-m-d',$time);
            $todo->due_date = $newformat;
            $todo->description = $config->task->description;
            $todo->tags = implode(",", $config->task->tags);
            $todo->status = "".($config->task->isCompleted?"Completed,":"").($config->task->isImportant?"Important":"");
            $assignee="";
            foreach ($config->task->assignee as $key => $value) {
                $assignee .= $value->id;
                if($key<count($config->task->assignee)-1){
                    $assignee.=",";
                }
            }
            $todo->assignee = $assignee;
            $todo->save();
            return response()->json([], 200);
        } catch(\Exception $err){
            return response()->json($err, 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function show(Todo $todo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function edit(Todo $todo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Todo $todo)
    {
        //
        $config = json_decode(file_get_contents('php://input'));
        try{
            $todo->title = $config->task->title;
            $time = strtotime($config->task->due_date);
            $newformat = date('Y-m-d',$time);
            $todo->due_date = $newformat;
            $todo->description = $config->task->description;
            $todo->tags = gettype($config->task->tags)=='array'?implode(",", $config->task->tags):$config->task->tags;
            $config->task->isCompleted = isset($config->task->isCompleted)?$config->task->isCompleted:false;
            $config->task->isImportant = isset($config->task->isImportant)?$config->task->isImportant:false;
            $todo->status = "".($config->task->isCompleted?"Completed":"").($config->task->isImportant?",Important":"");
	    if(gettype($config->task->assignee)=='string'){
	    	$todo->assignee = $config->task->assignee;
	    } else {
              	$assignee="";
            	foreach ($config->task->assignee as $key => $value) {
                   $assignee .= $value->id;
                   if($key<count($config->task->assignee)-1){
                      $assignee.=",";
                   }
            	}
		$todo->assignee = $assignee;
	    }
            
            $todo->save();
            return response()->json(200);
        } catch(\Exception $err){
            return response()->json($err, 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Todo  $todo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Todo $todo)
    {
        //
        try{
            $todo->delete();
        } catch(\Exception $err){
            return response()->json($err, 500);
        }

        return response()->json([],200);
    }
}
