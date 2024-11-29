<?php

namespace Database\Seeders;

use App\Models\Workflow;
use App\Models\workflowAction;
use App\Models\WorkflowCondition;
use Illuminate\Database\Seeder;

class WorkflowSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Workflow 1 : set the priority high where status inactive
        $workflow1 = Workflow::create(['name'=>'Workflow1']);
        WorkflowCondition::create([
            'workflow_id'=>$workflow1->id,
            'field'=>'status',
            'operation'=>'=',
            'value'=>'inactive'
            ]);
        WorkflowAction::create([
            'workflow_id'=>$workflow1->id,
            'action_type'=>'update_field',
            'target_field'=>'priority',
            'value'=>'high'
        ]);

        //Workflow 2 : update the first task set the status inactive
        $workflow2 = Workflow::create(['name'=>'Workflow2']);
        WorkflowCondition::create([
            'workflow_id'=>$workflow2->id,
            'field'=>'id',
            'operation'=>'=',
            'value'=>'1'
        ]);
        WorkflowAction::create([
            'workflow_id'=>$workflow2->id,
            'action_type'=>'update_field',
            'target_field'=>'status',
            'value'=>'inactive'
        ]);

        //Workflow 3 :  update wrong condition

        $workflow3 = Workflow::create(['name'=>'Workflow3']);
        WorkflowCondition::create([
            'workflow_id'=>$workflow3->id,
            'field'=>'status',
            'operation'=>'=',
            'value'=>'high'
        ]);
        WorkflowAction::create([
            'workflow_id'=>$workflow3->id,
            'action_type'=>'update_field',
            'target_field'=>'status',
            'value'=>'active'
        ]);


        //Workflow 4 :  update wrong action (No user id in task table)

        $workflow4 = Workflow::create(['name'=>'Workflow4']);
        WorkflowCondition::create([
            'workflow_id'=>$workflow4->id,
            'field'=>'priority',
            'operation'=>'=',
            'value'=>'high'
        ]);
        WorkflowAction::create([
            'workflow_id'=>$workflow4->id,
            'action_type'=>'update_field',
            'target_field'=>'user_id',
            'value'=>'3'
        ]);



        //Workflow 5 :  log to info for task 4
        $workflow5 = Workflow::create(['name'=>'Workflow5']);
        WorkflowCondition::create([
            'workflow_id'=>$workflow5->id,
            'field'=>'id',
            'operation'=>'=',
            'value'=>'5'
        ]);
        WorkflowAction::create([
            'workflow_id'=>$workflow5->id,
            'action_type'=>'log_message',
            'value'=>'This Message For Logging The Task 5'
        ]);
    }
}
