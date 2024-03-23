import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/usecase/task/get_all_task_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_forge/di/di.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';

@injectable
class TaskBloc extends BaseBloc<TaskEvent, TaskState> implements LibraryInitializer<void> {
  final GetAllTaskUsecase _getAllTaskUsecase;
  TaskBloc(this._getAllTaskUsecase) : super(TaskLoadingState());

  static TaskBloc get to => di<TaskBloc>()..init();

  @override
  void listEvent() {
    on<TaskLoadingEvent>(_onTaskLoadingEvent);
    on<TaskLoadmoreEvent>(_onTaskLoadmoreEvent);
    on<TaskShowFilterEvent>(_onTaskShowFilterEvent);
    on<TaskLoadedSuccessEvent>(_onTaskLoadedSuccessEvent);
  }

  @override
  Future<void> init() async {
    add(TaskLoadingEvent());
  }

  void _onTaskLoadingEvent(TaskLoadingEvent event, Emitter<TaskState> emit) async {
    final res = await _getAllTaskUsecase.invoke(null);
    res.when(error: (type, error, code) {
      print('error....: $error');
    }, success: (data) {
      if(data == null || data.isEmpty) {
          
      }
      print('object... $data');
    },);
  }

  void _onTaskLoadmoreEvent(TaskLoadmoreEvent event, Emitter<TaskState> emit) {}

  void _onTaskShowFilterEvent(TaskShowFilterEvent event, Emitter<TaskState> emit) {}

  void _onTaskLoadedSuccessEvent(TaskLoadedSuccessEvent event, Emitter<TaskState> emit) {}
}
