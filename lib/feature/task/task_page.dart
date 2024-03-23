import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends CoreBindingState<TaskPage, TaskBloc> {
  @override
  TaskBloc get initBloc => TaskBloc.to;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
        if(state is TaskLoadingState) {
          return Column(
            children: [
              SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
            ],
          );
        }
        return SizedBox();
      },),
    );
  }
}