import 'package:core/core.dart';
import 'package:core/service/app_dialogs.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_forge/common/constants/app_color.dart';
import 'package:todo_forge/common/constants/size_global.dart';
import 'package:todo_forge/common/widgets/custom_button.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_event.dart';
import 'package:todo_forge/feature/task/bloc/task_state.dart';
import 'package:todo_forge/model/task_model.dart';
import 'package:todo_forge/shared/task_status.dart';

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
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? _selectedDate;

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
              CustomCalendarComp(onChangedDate: _onChangedDate),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeGlobal.padding, vertical: SizeGlobal.padding),
                child: Column(
                  children: [
                    BuildTextField(
                      hint: 'Name',
                      controller: nameController,
                      onChanged: (v) {},
                    ),
                    const SizedBox(height: SizeGlobal.padding),
                    BuildTextField(
                      hint: 'Description',
                      controller: descriptionController,
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
                  onPressed: _handleSave,
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
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _handleSave() async {
    // SnackBarService.instance().show(context, 'message');
    // AppDialogs.show(
    //   context,
    //   barrierDismissible: true,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Container(
    //         height: MediaQuery.sizeOf(context).height / 3.5,
    //       ),
    //     );
    //   },
    // );

    if (nameController.text.trim().isEmpty) {
      SnackBarService.instance().show(context, 'Name task cannot blank', status: SnackbarStatus.failure);
      return;
    }

    var param = TaskParam(
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      status: TaskStatus.inProccess.index,
      dueDate: _selectedDate?.toString(),
      createdAt: DateTime.now().toString(),
    );

    context.read<TaskBloc>().add(AddNewTaskEvent(param: param));
    nameController.clear();
    descriptionController.clear();
    _selectedDate = null;
    SnackBarService.instance().show(context, 'Add a new task successful');
    AppNavigator.instance().close();
  }

  void _onChangedDate(DateTime value) => _selectedDate = value;
}
