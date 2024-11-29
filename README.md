
# Laravel Workflow Project

# TOC
1. [Overview](#overview)
2. [Project Layers](#project-layers)
3. [Database Schema](#database-schema)
4. [Seeders](#seeders)
5. [Installation](#installation)



## Overview
This project is built using **Laravel 9** and follows a structured architecture with distinct layers to enhance maintainability and scalability.

### Project Layers

1. **Models**:
    - Represent database tables and their relationships.
    - Serve as the foundation for database operations and provide abstraction for workflow conditions, actions, and logs.

2. **Controllers**:
    - Handle incoming API requests.
    - Use the **Service Layer** to fetch data and perform business logic.
    - Return structured responses for the API.

3. **Service Layer**:
    - Encapsulates business logic.
    - Handles:
        - Fetching workflows and their related data.
        - Evaluating conditions based on workflow rules.
        - Executing actions, including database updates and logging.

---

## Database Schema

### 1. Workflows
| Column        | Type                 | Description                                    |
|---------------|----------------------|------------------------------------------------|
| `id`          | Integer (Primary Key)| Unique identifier for the workflow.           |
| `name`        | String               | Name of the workflow.                         |
| `trigger_type`| Enum (`manual`, `automated`) | Defines if the workflow is manually or automatically triggered. |
| `created_at`  | Timestamp            | Timestamp when the workflow was created.      |
| `updated_at`  | Timestamp            | Timestamp when the workflow was last updated. |




---

### 2. Workflow Conditions
| Column       | Type                 | Description                                    |
|--------------|----------------------|------------------------------------------------|
| `id`         | Integer (Primary Key)| Unique identifier for the condition.          |
| `workflow_id`| Foreign Key          | References the workflow this condition belongs to. |
| `field`      | String               | Field being evaluated (e.g., `status`).       |
| `operation`  | Enum (`<`, `>`, `=`, `<=`, `>=`) | Logical operation for evaluation.            |
| `value`      | String               | Value to compare the field against.           |
| `created_at` | Timestamp            | Timestamp when the condition was created.     |
| `updated_at` | Timestamp            | Timestamp when the condition was last updated.|



---

### 3. Workflow Actions
| Column       | Type                 | Description                                    |
|--------------|----------------------|------------------------------------------------|
| `id`         | Integer (Primary Key)| Unique identifier for the action.             |
| `workflow_id`| Foreign Key          | References the workflow this action belongs to. |
| `action_type`| Enum (`update_field`, `log_message`) | Type of action to execute.                  |
| `target_field`| String (Nullable)   | The field to be updated (for `update_field`).  |
| `value`      | Text                 | The value to update or log.                   |
| `created_at` | Timestamp            | Timestamp when the action was created.        |
| `updated_at` | Timestamp            | Timestamp when the action was last updated.   |


---

### 4. History Logs
| Column          | Type                | Description                                 |
|------------------|---------------------|---------------------------------------------|
| `id`            | Integer (Primary Key) | Unique identifier for the log entry.        |
| `workflow_id`   | Foreign Key         | References the workflow this log entry belongs to. |
| `status`        | String              | Execution status (`success` or `failure`). |
| `error_message` | String (Nullable)   | Error message in case of failure.          |
| `effected_rows` | Integer             | Number of rows affected by the action.     |
| `created_at`    | Timestamp           | Timestamp when the log entry was created.  |
| `updated_at`    | Timestamp           | Timestamp when the log entry was last updated.|



---
## Seeders

### **TaskSeeder**
The `TaskSeeder` populates the `tasks` table with 10 sample tasks, including various statuses and priorities. These tasks are used to test and validate workflows.

---

### **WorkflowSeeder**
The `WorkflowSeeder` creates workflows with predefined conditions and actions to test specific scenarios. Below are the workflows included:

1. **Workflow 1**:
    - **Condition**: `status = inactive`
    - **Action**: Updates the `priority` field to `high` for tasks meeting the condition.

2. **Workflow 2**:
    - **Condition**: `id = 1`
    - **Action**: Updates the `status` field to `inactive` for the first task.

3. **Workflow 3**:
    - **Condition**: `status = high` (intentionally incorrect condition).
    - **Action**: Attempts to update the `status` field to `active`.

4. **Workflow 4**:
    - **Condition**: `priority = high`
    - **Action**: Attempts to update a non-existent `user_id` field.

5. **Workflow 5**:
    - **Condition**: `id = 5`
    - **Action**: Logs a custom message for the task with ID 5 to overflow file.

These workflows ensure that various conditions and actions are tested, including successful updates, incorrect conditions, and logging.


## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yalkahaleh/workflow.git
   cd workflow
   ```

2. **Install Dependencies**:
   ```bash
   composer install
   ```

3. **Set Up Environment**:
    - Copy `.env.example` to `.env`.
    - Update database.


4. **Run Migrations**:
   If you want to migrate the database, use the following command:
   ```bash
   php artisan migrate:fresh --seed
   ``` 
   Alternatively, you can find the migrated database in the database directory (workflow.sql).


5. **Start the Application**:
   ```bash
   php artisan serve
   ```
