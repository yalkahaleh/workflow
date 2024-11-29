<?php

namespace App\Listeners;

use App\Events\TaskTrigger;
use App\Models\Task;
use Illuminate\Support\Facades\DB;

class UpdateTask
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param object $event
     * @return void
     * @throws \Exception
     */
    public function handle(TaskTrigger $event)
    {
        $field = $event->workflow->condition->field;
        $operation = $event->workflow->condition->operation;
        $value = $event->workflow->condition->value;
        $targetField = $event->workflow->action->target_field;
        $newValue = $event->workflow->action->value;
        DB::beginTransaction();
        try {
            Task::where($field, $operation, $value)
                ->update([$targetField => $newValue]);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            throw ($e);
        }
    }
}
