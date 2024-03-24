import 'package:domain/common/table_name.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM ${TableName.task} ORDER BY CASE WHEN is_pinned = 1 THEN 0 ELSE 1 END, created_at DESC')
  Future<List<TaskEntity>> findAllTask();

  @Query('SELECT name FROM ${TableName.task}')
  Stream<List<String>> findAllTaskName();

  @Query('SELECT * FROM ${TableName.task} WHERE id = :id')
  Stream<TaskEntity?> findTaskById(int id);

  @insert
  Future<void> insertTask(TaskEntity tasks);

  @delete
  Future<void> deleteTask(TaskEntity task);

  @update
  Future<void> updateTask(TaskEntity task);

  @Query('UPDATE OR ABORT ${TableName.task} SET status = :status WHERE id = :id')
  Future<int?> updateStatusById(int status, int id);

  @Query('SELECT * FROM ${TableName.task} WHERE name LIKE :name ORDER BY created_at DESC')
  Future<List<TaskEntity>> findAllTaskByName(String name);

  @Query('SELECT * FROM ${TableName.task}')
  Stream<List<TaskEntity>> findAllTasksAsStream();

  @Query('SELECT * FROM ${TableName.task} WHERE status = :status ORDER BY created_at DESC')
  Future<List<TaskEntity>> findAllTaskByStatus(int status);

  @Query('UPDATE OR ABORT ${TableName.task} SET is_pinned = :isPinned WHERE id = :id')
  Future<int?> updatePinnedById(int isPinned, int id);

  @Query('SELECT * FROM ${TableName.task} WHERE is_pinned = 1 LIMIT 1')
  Future<List<TaskEntity>> findPinnedTask();
}
