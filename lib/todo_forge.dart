import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'common/routes/custom_router_observer.dart';
import 'common/routes/routes.dart';
import 'common/theme/app_theme.dart';

class TodoForge extends StatefulWidget {
  const TodoForge({super.key});

  @override
  State<TodoForge> createState() => _TodoForgeState();
}

class _TodoForgeState extends State<TodoForge> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Forge',
      navigatorKey: AppNavigator.instance().navigatorKey,
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: ConfigLocalization.loads(),
      // supportedLocales: ConfigLocalization.supportedLocales(),
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: RoutePath.initial,
      onGenerateRoute: Routings.generateRoutes,
      navigatorObservers: [CustomRouterObserver()],
      builder: (context, child) {
        return AppOverlayLoading.instance().build().call(context, child);
      },
    );
  }
}
