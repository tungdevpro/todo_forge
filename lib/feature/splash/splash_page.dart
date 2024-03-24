import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:todo_forge/common/constants/app_color.dart';
import 'package:todo_forge/common/routes/routes.dart';

import '../../common/constants/font_size.dart' as font_size;
import '../../shared/widgets/build_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
    super.initState();
  }

   void startTimer() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      AppNavigator.instance().pushNamedAndRemoveUntil(RoutePath.task);
    });
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
        backgroundColor: AppColor.primary,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildText('Tasks', Colors.white, font_size.textBold,
                FontWeight.w600, TextAlign.center, TextOverflow.clip),
            const SizedBox(
              height: 10,
            ),
            buildText('A free app for everyone', Colors.white, font_size.textTiny,
                FontWeight.normal, TextAlign.center, TextOverflow.clip),
          ],
        )));
  }
}
