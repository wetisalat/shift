<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::group(['prefix' => 'auth'], function () {
    Route::post('login', [AuthController::class, 'login'])->name('auth.login');
    Route::post('register', [AuthController::class, 'register'])->name('auth.register');
    Route::post('password/forgot', [AuthController::class, 'forgotPassword'])->name('password.email');
    ROute::post('password/reset', [AuthController::class, 'resetPassword'])->name('password.update');

    Route::group(['middleware' => ['auth:sanctum', 'verified']], function() {
      Route::get('logout', [AuthController::class, 'logout'])->name('auth.logout');
      Route::get('user', [AuthController::class, 'user'])->name('auth.user');
      Route::post('2fa', [AuthController::class, 'verifyTwoFactor'])->name('twofactor.verify');
    });

    Route::get('email/verify/{id}/{hash}', [AuthController::class, 'verifyEmail'])->name('email-verification.verify');
});
