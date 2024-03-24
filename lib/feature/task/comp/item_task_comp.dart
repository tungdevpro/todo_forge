import 'package:core/util/util.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_forge/common/constants/app_color.dart';
import 'package:todo_forge/common/constants/icon_resource.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';
import 'package:todo_forge/shared/task_status.dart';

import '../../../common/constants/font_size.dart' as fs;
import '../../../model/task_model.dart';

class ItemTaskComp extends StatelessWidget {
  final TaskModel item;
  const ItemTaskComp({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id!.toString()),
      onDismissed: (_) => context.read<TaskBloc>().add(DeleteTaskEvent(taskEntity: item)),
      child: Container(
          margin: const EdgeInsets.only(bottom: SizeGlobal.paddingSM),
          padding: const EdgeInsets.symmetric(vertical: SizeGlobal.paddingSM),
          decoration: BoxDecoration(border: Border.all(color: AppColor.line), borderRadius: BorderRadius.circular(SizeGlobal.radiusXL)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: item.status == TaskStatus.inProccess.index ? false : true,
                onChanged: (value) => _onChangedTaskStatus(context, value),
                // onChanged: (value) {
                // var taskModel = TaskModel(
                //     id: widget.taskModel.id,
                //     title: widget.taskModel.name,
                //     description: widget.taskModel.description,
                //     completed: !widget.taskModel.completed,
                //     startDateTime: widget.taskModel.startDateTime,
                //     stopDateTime: widget.taskModel.stopDateTime);
                // context.read<TasksBloc>().add(
                //     UpdateTaskEvent(taskModel: taskModel));
                // },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500, color: AppColor.onBackground, fontSize: fs.textLarge)),
                    const SizedBox(height: 5),
                    Text(item.description ?? '', maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColor.outline)),
                    if (item.dueDate != null) ...[
                      const SizedBox(height: 15),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: const BoxDecoration(color: AppColor.primary2, borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            children: [
                              SvgPicture.asset(IconResource.iconCalendar),
                              const SizedBox(width: 10),
                              Expanded(child: Text(formatDate(dateTime: item.dueDate.toString())))
                            ],
                          )),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )),
    );
  }

  void _onChangedTaskStatus(BuildContext context, bool? value) {
    print('value----> ${value}');
    var param = TaskParam(
      id: item.id,
      name: item.name,
      description: item.description,
      createdAt: item.createdAt,
      dueDate: item.dueDate,

      // status: !widget.taskModel.completed,
      // startDateTime: widget.taskModel.startDateTime,
      // stopDateTime: widget.taskModel.stopDateTime,
    );
    // context.read<TasksBloc>().add(
    //     UpdateTaskEvent(taskModel: taskModel));
  }
}
