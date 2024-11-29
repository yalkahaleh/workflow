<?php

namespace App\Services;

use App\Events\TaskTrigger;
use App\Models\HistoryLog;
use App\Models\Task;
use App\Models\Workflow;
use Illuminate\Support\Facades\Log;

class WorkflowService
{
    public function findWorkflowById($id)
    {
        return Workflow::with(['action', 'condition', 'log'])
            ->findOrFail($id);
    }

    public function evaluateCondition($id)
    {
        $workflow = $this->findWorkflowById($id);
        $field = $workflow->condition->field;
        $operation = $workflow->condition->operation;
        $value = $workflow->condition->value;

        $isConditionMet = Task::where($field, $operation, $value)
            ->exists();

        return $isConditionMet;

    }

    public function executeAction($id)
    {
        $conditionState = $this->evaluateCondition($id);
        $workflow = $this->findWorkflowById($id);

        $error_message = null;
        $effectedRows = 0;

        if ($conditionState) {
            $actionType = $workflow->action->action_type;
            $status = "success";
            if ($actionType === 'update_field') {

                try {
                    $effectedRows = Task::where($workflow->condition->field, $workflow->condition->operation,
                        $workflow->condition->value)->count();
                    TaskTrigger::dispatch($workflow);
                } catch (\Exception $e) {
                    $effectedRows = 0;
                    $status = "failure";
                    $error_message = $e->getMessage();
                }

            } elseif ($actionType === 'log_message') {
                $logMessage = $workflow->action->value;

                Log::channel('workflow')->info("Workflow {$workflow->id} executed: {$logMessage}");
            }

        } else {
            $status = "failure";
            $error_message = "Wrong Condition";
        }
        HistoryLog::create([
            'workflow_id' => $id,
            'status' => $status,
            'error_message' => $error_message,
            'effected_rows' => $effectedRows
        ]);
    }

}
