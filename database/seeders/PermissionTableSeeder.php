<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $tableNames = config('permission.table_names');

        $readDashboardPermission = Permission::where([
            'guard_name' => 'api',
            'action' => 'read',
            'subject' => 'Dashboard'
        ]);

        if(!is_null($readDashboardPermission)) {
            $readDashboardPermission = Permission::create([
                'name' => 'read dashboard',
                'guard_name' => 'api',
                'action' => 'read',
                'subject' => 'Dashboard',
                'created_at' => date('Y-m-d g:i:s')
            ]);
        }

        $readAuthPermission = Permission::where([
            'guard_name' => 'api',
            'action' => 'read',
            'subject' => 'Auth'
        ]);

        if(!is_null($readAuthPermission)) {

            $readAuthPermission = Permission::create([
                'name' => 'read auth',
                'guard_name' => 'api',
                'action' => 'read',
                'subject' => 'Auth',
                'created_at' => date('Y-m-d g:i:s')
            ]);
        }

        if(!Role::where(['name' => 'admin', 'guard_name' => 'api'])->exists()) {
            $admin = Role::create(['name' => 'admin', 'guard_name' => 'api']);

            $admin->givePermissionTo($readDashboardPermission);
            $admin->givePermissionTo($readAuthPermission);
        }

        if(!Role::where(['name' => 'staff', 'guard_name' => 'api'])->exists()) {
            $staff = Role::create(['name' => 'staff', 'guard_name'  => 'api']);

            $staff->givePermissionTo($readDashboardPermission);
            $staff->givePermissionTo($readAuthPermission);
        }

        if(!Role::where(['name' => 'client', 'guard_name' => 'api'])->exists()) {
            $client = Role::create(['name' => 'client', 'guard_name' => 'api']);

            $client->givePermissionTo($readDashboardPermission);
            $client->givePermissionTo($readAuthPermission);
        }
    }
}
