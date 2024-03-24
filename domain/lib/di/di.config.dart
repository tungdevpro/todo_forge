// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/task_repository.dart' as _i5;
import '../usecase/task/add_new_task_usecase.dart' as _i3;
import '../usecase/task/add_new_task_usecase_impl.dart' as _i4;
import '../usecase/task/get_all_task_usecase.dart' as _i6;
import '../usecase/task/get_all_task_usecase_impl.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt createDomainLayer({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddNewTaskUsecase>(
        () => _i4.AddNewTaskUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i6.GetAllTaskUsecase>(
        () => _i7.GetAllTaskUsecaseImpl(gh<_i5.TaskRepository>()));
    return this;
  }
}
