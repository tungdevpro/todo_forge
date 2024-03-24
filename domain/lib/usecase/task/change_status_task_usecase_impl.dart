import 'package:domain/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'add_new_task_usecase.dart';
import 'change_status_task_usecase.dart';

@Injectable(as: UpdateStatusTaskUsecase)
class UpdateStatusTaskUsecaseImpl extends UpdateStatusTaskUsecase {
  final TaskRepository _repository;
  UpdateStatusTaskUsecaseImpl(this._repository);
  @override
  Future<Result<void>> invoke(TaskParam? params) {
    return _repository.updateStatus(params);
  }
}
