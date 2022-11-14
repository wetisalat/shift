<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    protected $admin_role = 'admin';
    protected $client_role = 'client';
    protected $staff_role = 'staff';

    protected $permissions;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->permissions = [
            [
                'action' => 'read',
                'subject' => 'Dashboard',
                'roles' => [$this->admin_role, $this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Auth',
                'roles' => [$this->admin_role, $this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Clients',
                'roles' => [$this->admin_role],
            ], [
                'action' => 'read',
                'subject' => 'Plan',
                'roles' => [$this->admin_role],
            ], [
                'action' => 'read',
                'subject' => 'Coupons',
                'roles' => [$this->admin_role],
            ], [
                'action' => 'read',
                'subject' => 'Leave',
                'roles' => [$this->admin_role],
            ], [
                'action' => 'read',
                'subject' => 'Lunch',
                'roles' => [$this->admin_role],
            ], [
                'action' => 'read',
                'subject' => 'Staff',
                'roles' => [$this->admin_role, $this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Todo',
                'roles' => [$this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Expenses',
                'roles' => [$this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Schedule',
                'roles' => [$this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Request',
                'roles' => [$this->client_role],
            ], [
                'action' => 'read',
                'subject' => 'Attendance',
                'roles' => [$this->client_role, $this->staff_role],
            ], [
                'action' => 'read',
                'subject' => 'Payroll',
                'roles' => [$this->client_role],
            ], [
                'action' => 'read',
                'subject' => 'Analyse',
                'roles' => [$this->client_role],
            ], [
                'action' => 'read',
                'subject' => 'Profil',
                'roles' => [$this->staff_role],
            ]
        ];

        $tableNames = config('permission.table_names');

        foreach([$this->admin_role, $this->client_role, $this->staff_role] as $roleName) {
            Role::findOrCreate($roleName, 'api');
        }
        
        foreach($this->permissions as $permission) {
            $createdPermission = Permission::where([
                'guard_name' => 'api',
                'action' => $permission['action'],
                'subject' => $permission['subject']
            ])->first();

            if(is_null($createdPermission)) {
                $createdPermission = Permission::create([
                    'name' => $permission['action'] . ' ' . $permission['subject'],
                    'guard_name' => 'api',
                    'action' => $permission['action'],
                    'subject' => $permission['subject'],
                ]);
            }

            $createdPermission->syncRoles($permission['roles']);
        }
        
    }
}
