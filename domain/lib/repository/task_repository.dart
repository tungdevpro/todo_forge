import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';

abstract class TaskRepository {
  Future<Result<List<TaskEntity>>> getTasks();

  Future<Result<TaskEntity>> getTask(int id);

  Future<Result<void>> insertTask(TaskParam? param);

  Future<Result<void>> deleteTask(TaskParam? param);

  Future<Result<void>> updateStatus(TaskParam? param);

  Future<Result<List<TaskEntity>>> getTasksByKeyword(String? param);
}
