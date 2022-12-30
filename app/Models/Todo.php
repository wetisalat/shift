<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    use HasFactory, SoftDeletes;

    public function getIsCompletedAttribute(){
        return str_contains($this->status, 'Completed');
    }

    public function getIsDeletedAttribute(){
        return str_contains($this->status, 'Deleted');
    }

    public function getIsImportantAttribute(){
        return str_contains($this->status, 'Important');
    }
}
