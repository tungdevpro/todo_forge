import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_forge/feature/task/bloc/task_bloc.dart';

import 'di/di.dart';
import 'todo_forge.dart';

void main() async {
  await _prepare();
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (_) => TaskBloc.to)],
    child: const TodoForge(),
  ));
}

Future<void> _prepare() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await DataLayer.init();
  DomainLayer.init();
  configureDependencies();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
}
