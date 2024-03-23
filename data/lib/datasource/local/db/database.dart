import 'package:data/datasource/local/dao/task_dao.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'database.g.dart';

const _defaultVersion = 1;

@Database(version: _defaultVersion, entities: [TaskEntity])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}