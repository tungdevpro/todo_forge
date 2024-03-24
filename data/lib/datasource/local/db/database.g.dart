// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tasks` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `description` TEXT, `createdAt` TEXT, `dueDate` TEXT, `status` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _taskEntityInsertionAdapter = InsertionAdapter(
            database,
            'tasks',
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'createdAt': item.createdAt,
                  'dueDate': item.dueDate,
                  'status': item.status
                },
            changeListener),
        _taskEntityUpdateAdapter = UpdateAdapter(
            database,
            'tasks',
            ['id'],
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'createdAt': item.createdAt,
                  'dueDate': item.dueDate,
                  'status': item.status
                },
            changeListener),
        _taskEntityDeletionAdapter = DeletionAdapter(
            database,
            'tasks',
            ['id'],
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'createdAt': item.createdAt,
                  'dueDate': item.dueDate,
                  'status': item.status
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskEntity> _taskEntityInsertionAdapter;

  final UpdateAdapter<TaskEntity> _taskEntityUpdateAdapter;

  final DeletionAdapter<TaskEntity> _taskEntityDeletionAdapter;

  @override
  Future<List<TaskEntity>> findAllTask() async {
    return _queryAdapter.queryList('SELECT * FROM tasks',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            description: row['description'] as String?,
            createdAt: row['createdAt'] as String?,
            dueDate: row['dueDate'] as String?,
            status: row['status'] as int?));
  }

  @override
  Stream<List<String>> findAllTaskName() {
    return _queryAdapter.queryListStream('SELECT name FROM tasks',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'tasks',
        isView: false);
  }

  @override
  Stream<TaskEntity?> findTaskById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM tasks WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            description: row['description'] as String?,
            createdAt: row['createdAt'] as String?,
            dueDate: row['dueDate'] as String?,
            status: row['status'] as int?),
        arguments: [id],
        queryableName: 'tasks',
        isView: false);
  }

  @override
  Future<int?> updateStatusById(
    int status,
    int id,
  ) async {
    return _queryAdapter.query(
        'UPDATE OR ABORT tasks SET status = ?1 WHERE id = ?2',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [status, id]);
  }

  @override
  Future<List<TaskEntity>> findAllTaskByName(String name) async {
    return _queryAdapter.queryList('SELECT * FROM tasks WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            description: row['description'] as String?,
            createdAt: row['createdAt'] as String?,
            dueDate: row['dueDate'] as String?,
            status: row['status'] as int?),
        arguments: [name]);
  }

  @override
  Stream<List<TaskEntity>> findAllTasksAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM tasks',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            description: row['description'] as String?,
            createdAt: row['createdAt'] as String?,
            dueDate: row['dueDate'] as String?,
            status: row['status'] as int?),
        queryableName: 'tasks',
        isView: false);
  }

  @override
  Future<void> insertTask(TaskEntity tasks) async {
    await _taskEntityInsertionAdapter.insert(tasks, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    await _taskEntityUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    await _taskEntityDeletionAdapter.delete(task);
  }
}
