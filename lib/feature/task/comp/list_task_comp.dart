import 'package:flutter/material.dart';
import 'package:todo_forge/model/task_model.dart';

class ListTaskComp extends StatelessWidget {
  final List<TaskModel> items;
  const ListTaskComp({super.key, this.items = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
