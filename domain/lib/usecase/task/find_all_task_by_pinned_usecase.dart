import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/base/base_usecase.dart';

abstract class FindAllTaskByPinnedUsecase extends Usecase<List<TaskEntity>, NoParam?> {}
