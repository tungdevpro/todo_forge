import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';

extension TaskExtension on TaskParam {
  TaskEntity toEntity() {
    return TaskEntity(id: id, name: name, description: description, dueDate: dueDate, createdAt: createdAt, status: status);
  }
}
