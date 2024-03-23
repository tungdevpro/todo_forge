import 'package:core/core.dart';

abstract class TaskEvent extends BaseEvent {}

class TaskLoadingEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class TaskLoadmoreEvent extends TaskEvent {
  final int page;
  TaskLoadmoreEvent([this.page = 0]);

  @override
  List<Object?> get props => [page];
}

class TaskShowFilterEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class TaskSelectedFilterEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class TaskLoadedSuccessEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}