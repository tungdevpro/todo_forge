import 'package:domain/entity/task_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'tasks';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<TaskEntity>> findAllTask();

  @Query('SELECT name FROM $_tableName')
  Stream<List<String>> findAllTaskName();

  @Query('SELECT * FROM $_tableName WHERE id = :id')
  Stream<TaskEntity?> findTaskById(int id);

  @insert
  Future<void> insertTask(TaskEntity person);
}