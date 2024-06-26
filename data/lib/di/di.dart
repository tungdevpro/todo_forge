import 'package:data/datasource/local/dao/task_dao.dart';
import 'package:data/datasource/local/db/database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final di = GetIt.instance..allowReassignment = true;

@InjectableInit(
  initializerName: 'initializeDataLayer',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  await _registerDatabase(di);
  di.initializeDataLayer();
}

Future<void> _registerDatabase(GetIt locator) async {
  final database = await $FloorAppDatabase.databaseBuilder("task_database.db").build();
  di.registerLazySingleton<AppDatabase>(() => database);
  di.registerLazySingleton<TaskDao>(() => di.get<AppDatabase>().taskDao);
}



