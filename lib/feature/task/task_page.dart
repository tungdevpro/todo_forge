import 'package:core/core.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_forge/common/constants/icon_resource.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';
import 'package:todo_forge/feature/task/comp/empty_task_comp.dart';
import 'package:todo_forge/feature/task/comp/item_task_comp.dart';
import 'package:todo_forge/feature/task/comp/loading_task_comp.dart';

import '../../common/routes/routes.dart';
import '../../common/widgets/app_header.dart';
import '../../shared/widgets/custom_search_comp.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends CoreBindingState<TaskPage, TaskBloc> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: AppHeader(
            leadingIcon: LeadingIcon.none,
            leadingWidth: 0,
            text: 'My Task',
            automaticallyImplyLeading: false,
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(IconResource.iconMoon),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeGlobal.paddingSM, horizontal: SizeGlobal.padding),
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoadingState) return const LoadingTaskComp();
                if (state is TaskEmptyState) return const EmptyTaskComp();
                if (state is TaskSuccessState) {
                  return Column(
                    children: [
                      _buildSearch(),
                      const SizedBox(height: SizeGlobal.padding),
                      _buildListView(state.tasks),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          floatingActionButton: _buildFloatingActionButton(),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => AppNavigator.instance().pushNamed(RoutePath.createTask),
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildSearch() {
    return BuildTextField(
      hint: 'Enter your name task',
      prefixIcon: SvgPicture.asset(IconResource.iconSearch),
      suffixIcon: SvgPicture.asset(IconResource.iconFilter),
      onChanged: (v) => context.read<TaskBloc>().add(SearchTaskEvent(keywords: v)),
    );
  }

  Widget _buildListView(List<TaskEntity> tasks) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ItemTaskComp(item: tasks[index]);
        },
      ),
    );
  }
}
