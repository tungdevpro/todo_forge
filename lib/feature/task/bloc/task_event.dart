import 'package:core/core.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:domain/usecase/task/update_pinned_task_by_id_usecase.dart';

abstract class TaskEvent extends BaseEvent {}

class FetchingTaskEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class LoadmoreTaskEvent extends TaskEvent {
  final int page;
  LoadmoreTaskEvent([this.page = 0]);

  @override
  List<Object?> get props => [page];
}

class AddNewTaskEvent extends TaskEvent {
  final TaskParam param;

  AddNewTaskEvent({required this.param});

  @override
  List<Object?> get props => [param];
}

class FilterTaskEvent extends TaskEvent {
  final int status;

  FilterTaskEvent({required this.status});

  @override
  List<Object?> get props => [status];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskParam param;

  UpdateTaskEvent({required this.param});

  @override
  List<Object?> get props => [param];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskParam param;

  DeleteTaskEvent({required this.param});

  @override
  List<Object?> get props => [param];
}

class SearchTaskEvent extends TaskEvent {
  final String keywords;

  SearchTaskEvent({required this.keywords});

  @override
  List<Object?> get props => [keywords];
}

class UpdateStatusByIdTaskEvent extends TaskEvent {
  final TaskParam param;

  UpdateStatusByIdTaskEvent({required this.param});

  @override
  List<Object?> get props => [param];
}

class UpdatePinnedByIdTaskEvent extends TaskEvent {
  final TaskPinnedParam param;

  UpdatePinnedByIdTaskEvent({required this.param});

  @override
  List<Object?> get props => [param];
}
