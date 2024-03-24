import 'package:data/datasource/local/db/database.dart';
import 'package:data/mapper/task_mapper.dart';
import 'package:data/repository_impl/base/base_repository.dart';
import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/repository/task_repository.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
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
    final resp = await localCall(
      _appDatabase.taskDao.findAllTask(),
      mapper: (entity) {
        return entity;
      },
    );
    return resp;
  }

  @override
  Future<Result<void>> insertTask(TaskParam? param) async {
    final resp = await localCall<void, void>(
      _appDatabase.taskDao.insertTask(param!.toEntity()),
      mapper: (entity) {
        return entity;
      },
    );
    return resp;
  }

  @override
  Future<Result<void>> deleteTask(TaskParam? param) async {
    final resp = await localCall<void, void>(
      _appDatabase.taskDao.deleteTask(param!.toEntity()),
      mapper: (entity) {
        return entity;
      },
    );
    return resp;
  }

  @override
  Future<Result<void>> updateStatus(TaskParam? param) async {
    final resp = await localCall<void, void>(
      _appDatabase.taskDao.updateStatusById(param!.status!, param.id!),
      mapper: (entity) {
        return entity;
      },
    );
    return resp;
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksByKeyword(String? param) async {
    final resp = await localCall(
      _appDatabase.taskDao.findAllTaskByName(param ?? ''),
      mapper: (entity) {
        print('entity====> $entity');
        return entity;
      },
    );
    return resp;
  }
}
