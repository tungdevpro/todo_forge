import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';

abstract class TaskRepository {
  Future<Result<List<TaskEntity>>> getTasks();

  Future<Result<TaskEntity>> getTask(int id);
}