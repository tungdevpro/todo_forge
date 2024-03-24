import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_forge/common/constants/size_global.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icon_resource.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../shared/task_status.dart';

class FilterComp extends StatefulWidget {
  final TaskStatus? status;
  final VoidCallback? onClear;
  const FilterComp({super.key, this.status, this.onClear});

  @override
  State<FilterComp> createState() => _FilterCompState();
}

class _FilterCompState extends State<FilterComp> {
  TaskStatus? selectedStatus;
  final List<TaskStatus> status = [TaskStatus.inProccess, TaskStatus.done];

  @override
  void initState() {
    selectedStatus = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...status
                .map<Widget>((e) => ListTile(
                    onTap: () {
                      setState(() => selectedStatus = e);
                    },
                    title: Text(e.title),
                    leading: AnimatedSwitcher(
                        duration: const ShortDuration(),
                        transitionBuilder: _buildTransition,
                        child: SvgPicture.asset(selectedStatus == e ? IconResource.iconRadioSelected : IconResource.iconRadio, key: ValueKey(selectedStatus)))))
                .toList(),
            const SizedBox(height: SizeGlobal.paddingSM),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeGlobal.paddingSM),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonBase(
                      onPressed: _handleClear,
                      backgroundColor: Colors.white,
                      title: 'Clear',
                      colorTitle: AppColor.suffaceTint,
                      border: Border.all(color: AppColor.line),
                    ),
                  ),
                  const SizedBox(width: SizeGlobal.padding),
                  Expanded(
                    child: ButtonBase(onPressed: _handleApply, title: 'Apply'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTransition(Widget child, Animation<double> animation) => FadeTransition(opacity: animation, child: child);

  void _handleApply() {
    if (selectedStatus == null) {
      SnackBarService.instance().show(context, 'Please select status', status: SnackbarStatus.failure);
      return;
    }

    AppNavigator.instance().closeWithResult(selectedStatus);
  }

  void _handleClear() {
    setState(() {
      selectedStatus = null;
    });
    widget.onClear?.call();
  }
}
