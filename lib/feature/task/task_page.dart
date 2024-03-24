import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_forge/common/constants/icon_resource.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';

import '../../common/routes/routes.dart';
import '../../common/widgets/app_header.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends CoreBindingState<TaskPage, TaskBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: _buildAppbar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                // if (state is TaskLoadingState) return  Container(width: 30, height: 30, alignment: Alignment.center, child: CircularProgressIndicator());

                if (state is TaskEmptyState) return _buildEmptyTask();
                // return ListTaskShimmerComp();
                return const SizedBox();
              },
            )
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppHeader(
      leadingIcon: LeadingIcon.none,
      leadingWidth: 0,
      text: 'My Task',
      automaticallyImplyLeading: false,
      centerTitle: false,
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => AppNavigator.instance().pushNamed(RoutePath.createTask),
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
  
  Widget _buildEmptyTask() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: SvgPicture.asset(IconResource.iconNodata)),
        const SizedBox(height: SizeGlobal.paddingSM),
        const Text('No data yet'),
      ],
    );
  }
}
