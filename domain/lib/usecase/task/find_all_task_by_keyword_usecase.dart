import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/base/base_usecase.dart';

abstract class FindAllTaskByKeywordUsecase extends Usecase<List<TaskEntity>, String?> {}
