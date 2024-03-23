import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/repository/task_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/task/get_all_task_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllTaskUsecase)
class GetAllTaskUsecaseImpl extends GetAllTaskUsecase {
  final TaskRepository _repository;
  GetAllTaskUsecaseImpl(this._repository);

  @override
  Future<Result<List<TaskEntity>>> invoke(NoParam? params) {
    return _repository.getTasks();
  }
}
