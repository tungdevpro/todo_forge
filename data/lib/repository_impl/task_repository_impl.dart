import 'package:data/datasource/local/db/database.dart';
import 'package:data/repository_impl/base/base_repository.dart';
import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/repository/task_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl extends BaseRepository implements TaskRepository {
  final AppDatabase _appDatabase;
  TaskRepositoryImpl(this._appDatabase);

  @override
  Future<Result<TaskEntity>> getTask(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TaskEntity>>> getTasks() async {
    final resp = await localCall(_appDatabase.taskDao.findAllTask(), mapper: (entity) {
      print('entity----> $entity');
      return entity;
    },);
    return resp;
  }
}