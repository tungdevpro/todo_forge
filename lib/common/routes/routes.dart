import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_forge/feature/home/home_page.dart';
import 'package:todo_forge/feature/task/task_page.dart';

import '../../feature/create_task/create_task_page.dart';
import '../../feature/splash/splash_page.dart';

part 'route_path.dart';

abstract class Routings {
  const Routings._();

  static Map<String, WidgetBuilder> routes = {
    RoutePath.initial: (_) => const SplashPage(),
    RoutePath.home: (_) => const HomePage(),
    RoutePath.task: (_) => const TaskPage(),
    RoutePath.createTask: (_) => const CreateTaskPage(),
  };

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    String? routeName = settings.name?.split('?').first;

    return CupertinoPageRoute(
        builder: routes[routeName] ??
            (_) => const Scaffold(body: Center(child: Text('Not found'))),
        settings: settings);
  }
}
