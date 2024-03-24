import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/base/base_usecase.dart';

abstract class FindAllTaskByStatusUsecase extends Usecase<List<TaskEntity>, int> {}
