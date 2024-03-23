import 'package:domain/usecase/base/base_usecase.dart';

import '../../entity/task_entity.dart';

abstract class GetAllTaskUsecase extends Usecase<List<TaskEntity>, NoParam?> {
}
