import 'package:domain/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'add_new_task_usecase.dart';
import 'delete_task_usecase.dart';

@Injectable(as: DeleteTaskUsecase)
class DeleteTaskUsecaseImpl extends DeleteTaskUsecase {
  final TaskRepository _repository;
  DeleteTaskUsecaseImpl(this._repository);
  @override
  Future<Result<void>> invoke(TaskParam? params) {
    return _repository.deleteTask(params);
  }
}
