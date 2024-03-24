import 'package:domain/common/table_name.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM ${TableName.task}')
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

  @Query('SELECT * FROM ${TableName.task} WHERE name LIKE :name')
  Future<List<TaskEntity>> findAllTaskByName(String name);

  @Query('SELECT * FROM ${TableName.task}')
  Stream<List<TaskEntity>> findAllTasksAsStream();

  @Query('SELECT * FROM ${TableName.task} WHERE status = :status')
  Future<List<TaskEntity>> findAllTaskByStatus(int status);
}
