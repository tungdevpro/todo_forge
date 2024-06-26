import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:core/core.dart';
import 'package:core/service/app_dialogs.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:domain/usecase/task/change_status_task_usecase.dart';
import 'package:domain/usecase/task/delete_task_usecase.dart';
import 'package:domain/usecase/task/find_all_task_by_keyword_usecase.dart';
import 'package:domain/usecase/task/find_all_task_by_pinned_usecase.dart';
import 'package:domain/usecase/task/find_all_task_by_status_usecase.dart';
import 'package:domain/usecase/task/get_all_task_usecase.dart';
import 'package:domain/usecase/task/update_pinned_task_by_id_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:todo_forge/common/constants/font_size.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/common/helper/app_helper.dart';
import 'package:todo_forge/common/widgets/custom_button.dart';
import 'package:todo_forge/di/di.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';
import 'package:todo_forge/shared/task_status.dart';

@injectable
class TaskBloc extends BaseBloc<TaskEvent, TaskState> implements LibraryInitializer<void> {
  final GetAllTaskUsecase _getAllTaskUsecase;
  final AddNewTaskUsecase _addNewTaskUsecase;
  final UpdateStatusTaskUsecase _updateStatusTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final FindAllTaskByKeywordUsecase _findAllTaskByKeywordUsecase;
  final FindAllTaskByStatusUsecase _findAllTaskByStatusUsecase;
  final UpdatePinnedTaskByIdUsecase _updatePinnedTaskByIdUsecase;
  final FindAllTaskByPinnedUsecase _findAllTaskByPinnedUsecase;

  TaskBloc(
    this._getAllTaskUsecase,
    this._addNewTaskUsecase,
    this._updateStatusTaskUsecase,
    this._deleteTaskUsecase,
    this._findAllTaskByKeywordUsecase,
    this._findAllTaskByStatusUsecase,
    this._updatePinnedTaskByIdUsecase,
    this._findAllTaskByPinnedUsecase,
  ) : super(TaskLoadingState());

  static TaskBloc get to => di<TaskBloc>()..init();
  bool isFirst = true;

  @override
  void listEvent() {
    on<FetchingTaskEvent>(_onFetchingTaskEvent);
    on<AddNewTaskEvent>(_onAddNewTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
    on<FilterTaskEvent>(_onFilterTaskEvent);
    on<SearchTaskEvent>(_onSearchTaskEvent, transformer: debounce(const MediumDuration()));
    on<UpdateStatusByIdTaskEvent>(_onUpdateStatusByIdTaskEvent);
    on<UpdatePinnedByIdTaskEvent>(_onUpdatePinnedByIdTaskEvent);
  }

  @override
  Future<void> init() async {
    add(FetchingTaskEvent());
  }

  void _onFetchingTaskEvent(FetchingTaskEvent event, Emitter<TaskState> emit) async {
    final res = await _getAllTaskUsecase.invoke(null);
    res.when(
      error: (type, error, code) => emit(TaskFailedState()),
      success: (data) {
        if (data == null || data.isEmpty) {
          emit(TaskEmptyState());
          return;
        }
        emit(TaskSuccessState(tasks: data));
        if (isFirst) {
          final logs = data
              .map((e) {
                // Push to Array when task will be expired before 1 day of deadline time
                // and task'status is proccess
                if (e.dueDate != null && AppHelper.isOneDayBefore(DateTime.parse(e.dueDate!)) && e.status == TaskStatus.inProccess.index) {
                  return e;
                }
              })
              .where((element) => element != null)
              .toList();
          if (logs.isNotEmpty) {
            AppDialogs.show(
              context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
                content: Builder(
                  builder: (context) {
                    return Container(
                        height: (MediaQuery.sizeOf(context).height / 3.3),
                        width: MediaQuery.sizeOf(context).width - SizeGlobal.padding,
                        padding: const EdgeInsets.symmetric(horizontal: SizeGlobal.padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: SizeGlobal.paddingSM),
                              child: const Text('Task will be expired', style: TextStyle(fontSize: textExtraLarge, fontWeight: FontWeight.w500)),
                            ),
                            ...logs.map<Widget>((e) => Text(e?.name ?? '')).toList(),
                            Row(
                              children: [
                                Expanded(
                                    child: ButtonBase(
                                        onPressed: () {
                                          AppNavigator.instance().close();
                                          isFirst = false;
                                        },
                                        title: 'Đóng'))
                              ],
                            ),
                            const SizedBox(height: SizeGlobal.paddingSM)
                          ],
                        ));
                  },
                ),
              ),
            );
          }
        }
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

  void _onSearchTaskEvent(SearchTaskEvent event, Emitter<TaskState> emit) async {
    final result = await _findAllTaskByKeywordUsecase.invoke('%${event.keywords}%');
    result.when(
      error: (type, error, code) {},
      success: (data) => emit(TaskSuccessState(tasks: data ?? [])),
    );
  }

  void _onUpdateStatusByIdTaskEvent(UpdateStatusByIdTaskEvent event, Emitter<TaskState> emit) async => await _updateStatusTaskUsecase.invoke(event.param);

  void _onFilterTaskEvent(FilterTaskEvent event, Emitter<TaskState> emit) async {
    showLoading();
    final res = await _findAllTaskByStatusUsecase.invoke(event.status);
    hideLoading();
    res.when(
      error: (type, error, code) => emit(TaskFailedState()),
      success: (data) => emit(TaskSuccessState(tasks: data ?? [], status: event.status)),
    );
  }

  EventTransformer<Event> debounce<Event>(Duration duration) => (events, mapper) => events.debounce(duration).switchMap(mapper);

  void _onUpdatePinnedByIdTaskEvent(UpdatePinnedByIdTaskEvent event, Emitter<TaskState> emit) async {
    // Get task to be pinned
    final res = await _findAllTaskByPinnedUsecase.invoke(null);
    res.when(
      error: (type, error, code) {},
      success: (data) {
        if (data != null && data.isNotEmpty) {
          // Update pinned to FALSE while has data
          _updatePinnedTaskByIdUsecase.invoke(TaskPinnedParam(id: data.first.id!, isPinned: false));
        }
        // Update pinned to TRUE
        _updatePinnedTaskByIdUsecase.invoke(TaskPinnedParam(id: event.id, isPinned: true));
        add(FetchingTaskEvent());
        AppNavigator.instance().close();
      },
    );
  }
}
