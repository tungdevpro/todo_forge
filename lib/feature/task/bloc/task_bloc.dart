import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:domain/usecase/task/get_all_task_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_forge/di/di.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';

@injectable
class TaskBloc extends BaseBloc<TaskEvent, TaskState> implements LibraryInitializer<void> {
  final GetAllTaskUsecase _getAllTaskUsecase;
  final AddNewTaskUsecase _addNewTaskUsecase;
  TaskBloc(this._getAllTaskUsecase, this._addNewTaskUsecase) : super(TaskLoadingState());

  static TaskBloc get to => di<TaskBloc>()..init();

  @override
  void listEvent() {
    on<FetchingTaskEvent>(_onFetchingTaskEvent);
    on<AddNewTaskEvent>(_onAddNewTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
    on<SortTaskEvent>(_onSortTaskEvent);
    on<SearchTaskEvent>(_onSearchTaskEvent);
  }

  @override
  Future<void> init() async {
    add(FetchingTaskEvent());
  }

  void _onFetchingTaskEvent(FetchingTaskEvent event, Emitter<TaskState> emit) async {
    final res = await _getAllTaskUsecase.invoke(null);
    res.when(
      error: (type, error, code) {
        emit(TaskFailedState());
      },
      success: (data) {
        if (data == null || data.isEmpty) {
          emit(TaskEmptyState());
          return;
        }
        emit(TaskSuccessState(tasks: data));
      },
    );
  }

  void _onAddNewTaskEvent(AddNewTaskEvent event, Emitter<TaskState> emit) async {
    showLoading();
    // await Future.delayed(const Duration(seconds: 1));
    await _addNewTaskUsecase.invoke(event.param);
    hideLoading();
  }

  void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TaskState> emit) {}

  void _onDeleteTaskEvent(DeleteTaskEvent event, Emitter<TaskState> emit) {
    showLoading();

    hideLoading();
  }

  void _onSortTaskEvent(SortTaskEvent event, Emitter<TaskState> emit) {}

  void _onSearchTaskEvent(SearchTaskEvent event, Emitter<TaskState> emit) {}
}
