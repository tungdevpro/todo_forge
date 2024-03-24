import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'find_all_task_by_status_usecase.dart';

@Injectable(as: FindAllTaskByStatusUsecase)
class FindAllTaskByStatusUsecaseImpl extends FindAllTaskByStatusUsecase {
  final TaskRepository _repository;
  FindAllTaskByStatusUsecaseImpl(this._repository);

  @override
  Future<Result<List<TaskEntity>>> invoke(int params) {
    return _repository.getTasksByStatus(params);
  }
}
