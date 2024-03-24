import 'package:core/core.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_forge/common/constants/app_color.dart';
import 'package:todo_forge/common/constants/icon_resource.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';
import 'package:todo_forge/feature/task/comp/empty_task_comp.dart';
import 'package:todo_forge/feature/task/comp/item_task_comp.dart';
import 'package:todo_forge/feature/task/comp/loading_task_comp.dart';
import 'package:todo_forge/shared/task_status.dart';

import '../../common/routes/routes.dart';
import '../../common/widgets/app_header.dart';
import '../../shared/widgets/custom_search_comp.dart';
import 'comp/filter_comp.dart';

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
              IconButton(onPressed: _onToggleDarkLight, icon: SvgPicture.asset(IconResource.iconMoon)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeGlobal.paddingSM, horizontal: SizeGlobal.paddingSM),
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoadingState) return const LoadingTaskComp();
                if (state is TaskEmptyState) return const EmptyTaskComp();
                if (state is TaskSuccessState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildSearch()),
                          const SizedBox(width: SizeGlobal.paddingSM),
                          GestureDetector(
                              onTap: () => _handleFilter(state.status),
                              child: SvgPicture.asset(
                                IconResource.iconFilter,
                                colorFilter: state.status != null ? const ColorFilter.mode(AppColor.primary, BlendMode.srcIn) : null,
                              )),
                        ],
                      ),
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
      onChanged: (v) => bloc.add(SearchTaskEvent(keywords: v)),
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

  void _handleFilter(int? status) async {
    final result = await showModalBottomSheet<TaskStatus>(
        context: context,
        builder: (context) => FilterComp(
              status: status != null ? (status == TaskStatus.inProccess.index ? TaskStatus.inProccess : TaskStatus.done) : null,
              onClear: () => bloc.add(FetchingTaskEvent()),
            ));
    if (result == null) return;
    if (context.mounted) bloc.add(FilterTaskEvent(status: result.index));
  }

  void _onToggleDarkLight() {}
}
