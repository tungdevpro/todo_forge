import 'package:flutter/material.dart';

class LoadingTaskComp extends StatelessWidget {
  const LoadingTaskComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 30, height: 30, alignment: Alignment.center, child: const CircularProgressIndicator());
  }
}
