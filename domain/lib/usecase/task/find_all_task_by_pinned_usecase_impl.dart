import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'find_all_task_by_pinned_usecase.dart';

@Injectable(as: FindAllTaskByPinnedUsecase)
class FindAllTaskByPinnedUsecaseImpl extends FindAllTaskByPinnedUsecase {
  final TaskRepository _repository;
  FindAllTaskByPinnedUsecaseImpl(this._repository);

  @override
  Future<Result<List<TaskEntity>>> invoke(NoParam? params) {
    return _repository.getTasksByPinned();
  }
}
