import 'package:flutter/material.dart';
import 'package:todo_forge/common/widgets/app_header.dart';

import '../task/task_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }
  
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return AppHeader(leadingIcon: LeadingIcon.none, leadingWidth: 0, text: 'My Task', automaticallyImplyLeading: false, centerTitle: true);
  }
  
  Widget _buildBody() {
    return const TaskPage();
  }
}
