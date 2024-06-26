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
import '../usecase/task/change_status_task_usecase.dart' as _i18;
import '../usecase/task/change_status_task_usecase_impl.dart' as _i19;
import '../usecase/task/delete_task_usecase.dart' as _i6;
import '../usecase/task/delete_task_usecase_impl.dart' as _i7;
import '../usecase/task/find_all_task_by_keyword_usecase.dart' as _i8;
import '../usecase/task/find_all_task_by_keyword_usecase_impl.dart' as _i9;
import '../usecase/task/find_all_task_by_pinned_usecase.dart' as _i10;
import '../usecase/task/find_all_task_by_pinned_usecase_impl.dart' as _i11;
import '../usecase/task/find_all_task_by_status_usecase.dart' as _i12;
import '../usecase/task/find_all_task_by_status_usecase_impl.dart' as _i13;
import '../usecase/task/get_all_task_usecase.dart' as _i14;
import '../usecase/task/get_all_task_usecase_impl.dart' as _i15;
import '../usecase/task/update_pinned_task_by_id_usecase.dart' as _i16;
import '../usecase/task/update_pinned_task_by_id_usecase_impl.dart' as _i17;

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
    gh.factory<_i6.DeleteTaskUsecase>(
        () => _i7.DeleteTaskUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i8.FindAllTaskByKeywordUsecase>(
        () => _i9.FindAllTaskByKeywordUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i10.FindAllTaskByPinnedUsecase>(
        () => _i11.FindAllTaskByPinnedUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i12.FindAllTaskByStatusUsecase>(
        () => _i13.FindAllTaskByStatusUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i14.GetAllTaskUsecase>(
        () => _i15.GetAllTaskUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i16.UpdatePinnedTaskByIdUsecase>(
        () => _i17.UpdatePinnedTaskByIdUsecaseImpl(gh<_i5.TaskRepository>()));
    gh.factory<_i18.UpdateStatusTaskUsecase>(
        () => _i19.UpdateStatusTaskUsecaseImpl(gh<_i5.TaskRepository>()));
    return this;
  }
}
