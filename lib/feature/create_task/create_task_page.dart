import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_forge/common/constants/app_color.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/common/widgets/custom_button.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';

import '../../common/constants/icon_resource.dart';
import '../../common/widgets/app_header.dart';
import '../../shared/widgets/custom_search_comp.dart';
import 'comp/custom_calendar_comp.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: Scaffold(
        appBar: AppHeader(
          text: 'Create new task',
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: BlocListener<TaskBloc, TaskState>(
          listener: (BuildContext context, TaskState state) {},
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              CustomCalendarComp(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeGlobal.padding, vertical: SizeGlobal.padding),
                child: Column(
                  children: [
                    BuildTextField(
                      hint: 'Name',
                      onChanged: (v) {},
                    ),
                    const SizedBox(height: SizeGlobal.padding),
                    BuildTextField(
                      hint: 'Description',
                      inputType: TextInputType.multiline,
                      onChanged: (v) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: SizeGlobal.padding),
          child: SafeArea(
              child: Row(
            children: [
              Expanded(
                child: ButtonBase(
                  onPressed: () => AppNavigator.instance().close(),
                  backgroundColor: Colors.white,
                  title: 'Cancel',
                  colorTitle: AppColor.suffaceTint,
                  border: Border.all(color: AppColor.line),
                ),
              ),
              const SizedBox(width: SizeGlobal.padding),
              Expanded(
                child: ButtonBase(
                  onPressed: () {
                    SnackBarService.instance().show(context, 'message');
                  },
                  title: 'Save',
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }
}
