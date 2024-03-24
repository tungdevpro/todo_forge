import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:domain/usecase/task/change_status_task_usecase.dart';
import 'package:domain/usecase/task/delete_task_usecase.dart';
import 'package:domain/usecase/task/find_all_task_by_keyword_usecase.dart';
import 'package:domain/usecase/task/get_all_task_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:todo_forge/di/di.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

@injectable
class TaskBloc extends BaseBloc<TaskEvent, TaskState> implements LibraryInitializer<void> {
  final GetAllTaskUsecase _getAllTaskUsecase;
  final AddNewTaskUsecase _addNewTaskUsecase;
  final UpdateStatusTaskUsecase _updateStatusTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final FindAllTaskByKeywordUsecase _findAllTaskByKeywordUsecase;
  TaskBloc(this._getAllTaskUsecase, this._addNewTaskUsecase, this._updateStatusTaskUsecase, this._deleteTaskUsecase, this._findAllTaskByKeywordUsecase)
      : super(TaskLoadingState());

  static TaskBloc get to => di<TaskBloc>()..init();

  @override
  void listEvent() {
    on<FetchingTaskEvent>(_onFetchingTaskEvent);
    on<AddNewTaskEvent>(_onAddNewTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
    on<SortTaskEvent>(_onSortTaskEvent);
    on<SearchTaskEvent>(_onSearchTaskEvent, transformer: debounce(const MediumDuration()));
    on<UpdateStatusByIdTaskEvent>(_onUpdateStatusByIdTaskEvent);
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
    await _addNewTaskUsecase.invoke(event.param);
    hideLoading();
    add(FetchingTaskEvent());
  }

  void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TaskState> emit) async {}

  void _onDeleteTaskEvent(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    showLoading();
    await _deleteTaskUsecase.invoke(event.param);
    hideLoading();
  }

  void _onSortTaskEvent(SortTaskEvent event, Emitter<TaskState> emit) async {}

  void _onSearchTaskEvent(SearchTaskEvent event, Emitter<TaskState> emit) async {
    final result = await _findAllTaskByKeywordUsecase.invoke('%${event.keywords}%');
    result.when(
      error: (type, error, code) {},
      success: (data) {
        // if (data == null || data.isEmpty) {
        //    emit(TaskSuccessState(tasks: data));
        //   return;
        // }
        emit(TaskSuccessState(tasks: data ?? []));
      },
    );
  }

  void _onUpdateStatusByIdTaskEvent(UpdateStatusByIdTaskEvent event, Emitter<TaskState> emit) async => await _updateStatusTaskUsecase.invoke(event.param);
}
