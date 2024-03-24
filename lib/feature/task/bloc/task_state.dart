import 'package:core/core.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:todo_forge/shared/task_status.dart';

abstract class TaskState extends BaseState {
  final List<TaskEntity> tasks;
  final bool noMoreData;
  final String? error;

  TaskState({this.tasks = const [], this.noMoreData = true, this.error});

  @override
  List<Object?> get props => [tasks, noMoreData, error];
}

class TaskLoadingState extends TaskState {}

class TaskSuccessState extends TaskState {
  final int? status;
  TaskSuccessState({super.tasks, super.noMoreData, this.status});

  @override
  List<Object?> get props => [super.props, status];
}

class TaskEmptyState extends TaskState {
  TaskEmptyState({
    super.error,
  });

  @override
  List<Object?> get props => [super.props];
}

class TaskFailedState extends TaskState {
  TaskFailedState({super.error});
}
