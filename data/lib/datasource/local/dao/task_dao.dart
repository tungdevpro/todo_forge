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
  Future<int?> updateTypeById(int status, int id);
}
