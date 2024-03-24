import 'package:data/datasource/local/db/database.dart';
import 'package:data/mapper/task_mapper.dart';
import 'package:data/repository_impl/base/base_repository.dart';
import 'package:domain/common/result.dart';
import 'package:domain/entity/task_entity.dart';
import 'package:domain/repository/task_repository.dart';
import 'package:domain/usecase/task/add_new_task_usecase.dart';
import 'package:domain/usecase/task/update_pinned_task_by_id_usecase.dart';
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
    return await localCall(_appDatabase.taskDao.findAllTask(), mapper: (e) => e);
  }

  @override
  Future<Result<void>> insertTask(TaskParam? param) async {
    return await localCall<void, void>(_appDatabase.taskDao.insertTask(param!.toEntity()), mapper: (e) => e);
  }

  @override
  Future<Result<void>> deleteTask(TaskParam? param) async {
    return await localCall<void, void>(_appDatabase.taskDao.deleteTask(param!.toEntity()), mapper: (e) => e);
  }

  @override
  Future<Result<void>> updateStatus(TaskParam? param) async {
    return await localCall<void, void>(_appDatabase.taskDao.updateStatusById(param!.status!, param.id!), mapper: (e) => e);
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksByKeyword(String? param) async {
    return await localCall(_appDatabase.taskDao.findAllTaskByName(param ?? ''), mapper: (e) => e);
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksByStatus(int status) async {
    return await localCall(_appDatabase.taskDao.findAllTaskByStatus(status), mapper: (e) => e);
  }

  @override
  Future<Result<void>> updatePinned(TaskPinnedParam? param) async {
    return await localCall<void, void>(_appDatabase.taskDao.updatePinnedById(param!.isPinned ? 1 : 0, param.id), mapper: (e) => e);
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksByPinned() async {
    return await localCall(_appDatabase.taskDao.findPinnedTask(), mapper: (e) => e);
  }
}
