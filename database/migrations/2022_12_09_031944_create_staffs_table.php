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
        Schema::create('staff', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->date('birth_date')->nullable();
            $table->string('placebirth')->nullable();
            $table->string('nationality')->nullable();
            $table->string('nin')->nullable();
            $table->string('idnumber')->nullable();
            $table->string('documenttype')->nullable();
            $table->date('expirydate')->nullable();
            $table->string('address_line_1')->nullable();
            $table->string('address_line_2')->nullable();
            $table->string('postcode')->nullable();
            $table->string('city')->nullable();
            $table->string('state')->nullable();
            $table->string('country')->nullable();
            $table->string('full_name_1')->nullable();
            $table->string('emergency_phone1')->nullable();
            $table->string('emergency_relationship1')->nullable();
            $table->string('full_name_2')->nullable();
            $table->string('emergency_phone2')->nullable();
            $table->string('emergency_relationship2')->nullable();
            $table->string('contract')->nullable();
            $table->string('timetype')->nullable();
            $table->date('hiringdate')->nullable();
            $table->date('enddate')->nullable();
            $table->string('categorie')->nullable();
            $table->string('statut')->nullable();
            $table->string('echelon')->nullable();
            $table->string('position')->nullable();
            $table->string('shift')->nullable();
            $table->string('weeklyworkingtime')->nullable();
            $table->double('monthly_salary')->nullable();
            $table->double('hourly_salary')->nullable();
            $table->double('overtime_salary')->nullable();
            $table->string('status')->nullable();
            $table->string('nightamount')->nullable();
            $table->string('transportamount')->nullable();
            $table->string('bankname')->nullable();
            $table->string('bic')->nullable();
            $table->string('iban')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('staff', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
        });
        Schema::dropIfExists('staff');
    }
};
