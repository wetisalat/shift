<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $tableNames = config('permission.table_names');

        Schema::table($tableNames['permissions'], function (Blueprint $table) {
            $table->string('action')->nullable()->after('guard_name');
            $table->string('subject')->nullable()->after('action');
            $table->json('fields')->nullable()->after('subject');
            $table->json('conditions')->nullable()->after('fields');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $tableNames = config('permission.table_names');

        Schema::table($tableNames['permissions'], function (Blueprint $table) {
            $table->dropColumn('conditions');
            $table->dropColumn('fields');
            $table->dropColumn('subject');
            $table->dropColumn('action');
        });
    }
};
