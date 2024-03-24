import 'package:domain/usecase/base/base_usecase.dart';

import '../../entity/task_entity.dart';

abstract class AddNewTaskUsecase extends Usecase<void, TaskParam?> {}

class TaskParam extends TaskEntity {
  TaskParam({super.id, super.name, super.description, super.dueDate, super.createdAt, super.status});
}
