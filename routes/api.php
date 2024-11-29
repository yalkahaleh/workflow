<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\WorkflowController;

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


Route::group([
    'middleware' => ['api'],
    'prefix' => 'workflow'
], function () {
    Route::get('/{id}', [WorkflowController::class, 'show']);
    Route::post('/{id}/evaluate', [WorkflowController::class, 'evaluateCondition']);
    Route::post('/{id}/execute', [WorkflowController::class, 'executeAction']);
});

