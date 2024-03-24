import 'package:core/core.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';

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

class SortTaskEvent extends TaskEvent {
  final int sortOption;

  SortTaskEvent({required this.sortOption});

  @override
  List<Object?> get props => [sortOption];
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
