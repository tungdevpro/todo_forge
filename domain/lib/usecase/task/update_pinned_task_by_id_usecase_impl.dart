import 'package:domain/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'update_pinned_task_by_id_usecase.dart';

@Injectable(as: UpdatePinnedTaskByIdUsecase)
class UpdatePinnedTaskByIdUsecaseImpl extends UpdatePinnedTaskByIdUsecase {
  final TaskRepository _repository;
  UpdatePinnedTaskByIdUsecaseImpl(this._repository);

  @override
  Future<Result<void>> invoke(TaskPinnedParam? params) {
    return _repository.updatePinned(params);
  }
}
