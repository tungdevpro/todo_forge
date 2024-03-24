import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repository/task_repository.dart';
import 'find_all_task_by_keyword_usecase.dart';

@Injectable(as: FindAllTaskByKeywordUsecase)
class FindAllTaskByKeywordUsecaseImpl extends FindAllTaskByKeywordUsecase {
  final TaskRepository _repository;
  FindAllTaskByKeywordUsecaseImpl(this._repository);

  @override
  Future<Result<List<TaskEntity>>> invoke(String? params) {
    return _repository.getTasksByKeyword(params!);
  }
}
