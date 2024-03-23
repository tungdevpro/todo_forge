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
  Future<void> insertTask(TaskEntity person);
}