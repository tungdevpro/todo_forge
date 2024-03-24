import 'package:domain/usecase/base/base_usecase.dart';

abstract class UpdatePinnedTaskByIdUsecase extends Usecase<void, TaskPinnedParam?> {}

class TaskPinnedParam {
  final int id;
  final bool isPinned;

  TaskPinnedParam({required this.id, required this.isPinned});
}
