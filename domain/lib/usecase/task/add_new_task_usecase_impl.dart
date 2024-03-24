import 'package:domain/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'add_new_task_usecase.dart';

@Injectable(as: AddNewTaskUsecase)
class AddNewTaskUsecaseImpl extends AddNewTaskUsecase {
  final TaskRepository _repository;
  AddNewTaskUsecaseImpl(this._repository);
  @override
  Future<Result<void>> invoke(TaskParam? params) {
    return _repository.insertTask(params);
  }
}
