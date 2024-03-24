// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/usecase/task/add_new_task_usecase.dart' as _i5;
import 'package:domain/usecase/task/change_status_task_usecase.dart' as _i6;
import 'package:domain/usecase/task/delete_task_usecase.dart' as _i7;
import 'package:domain/usecase/task/find_all_task_by_keyword_usecase.dart'
    as _i8;
import 'package:domain/usecase/task/find_all_task_by_pinned_usecase.dart'
    as _i11;
import 'package:domain/usecase/task/find_all_task_by_status_usecase.dart'
    as _i9;
import 'package:domain/usecase/task/get_all_task_usecase.dart' as _i4;
import 'package:domain/usecase/task/update_pinned_task_by_id_usecase.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/task/bloc/task_bloc.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initialPresentationLayer({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.TaskBloc>(() => _i3.TaskBloc(
          gh<_i4.GetAllTaskUsecase>(),
          gh<_i5.AddNewTaskUsecase>(),
          gh<_i6.UpdateStatusTaskUsecase>(),
          gh<_i7.DeleteTaskUsecase>(),
          gh<_i8.FindAllTaskByKeywordUsecase>(),
          gh<_i9.FindAllTaskByStatusUsecase>(),
          gh<_i10.UpdatePinnedTaskByIdUsecase>(),
          gh<_i11.FindAllTaskByPinnedUsecase>(),
        ));
    return this;
  }
}
