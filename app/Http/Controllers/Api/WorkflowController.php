<?php

namespace App\Http\Controllers\Api;

use App\Helpers\ApiResponse;
use App\Http\Controllers\Controller;
use App\Services\WorkflowService;


class WorkflowController extends Controller
{

    protected $workflowService;

    public function __construct(WorkflowService $workflowService)
    {
        $this->workflowService = $workflowService;
    }

    public function show($id)
    {
        $workflow = $this->workflowService->findWorkflowById($id);
        return ApiResponse::success($workflow);
    }

    public function evaluateCondition($id)
    {
        $evaluationState = $this->workflowService->evaluateCondition($id);

        if ($evaluationState) {
            return ApiResponse::success();
        }
        return ApiResponse::error([], "Wrong Condition");

    }

    public function executeAction($id)
    {
        $this->workflowService->executeAction($id);
        return ApiResponse::success();
    }


}
