<?php

namespace Database\Seeders;

use App\Models\Task;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TaskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = Carbon::now();
        Task::insert([
            ['name' => 'Task 1', 'status' => 'active', 'priority' => 'low', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 2', 'status' => 'inactive', 'priority' => 'medium', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 3', 'status' => 'completed', 'priority' => 'high', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 4', 'status' => 'active', 'priority' => 'medium', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 5', 'status' => 'inactive', 'priority' => 'low', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 6', 'status' => 'active', 'priority' => 'low', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 7', 'status' => 'completed', 'priority' => 'medium', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 8', 'status' => 'active', 'priority' => 'high', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 9', 'status' => 'inactive', 'priority' => 'medium', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Task 10', 'status' => 'active', 'priority' => 'low', 'created_at' => $now, 'updated_at' => $now],
        ]);

    }
}
