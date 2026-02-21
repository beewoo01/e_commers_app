// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce_app/data/data_source/data_source_module.dart'
    as _i988;
import 'package:e_commerce_app/data/data_source/remote/display.api.dart'
    as _i649;
import 'package:e_commerce_app/data/repository_impl/display.repository_impl.dart'
    as _i644;
import 'package:e_commerce_app/domain/repository/display.repository.dart'
    as _i455;
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart'
    as _i757;
import 'package:e_commerce_app/presentation/main/bloc/cart_bloc/cart_bloc.dart'
    as _i992;
import 'package:e_commerce_app/presentation/pages/home/bloc/menu_bloc/menu_bloc.dart'
    as _i918;
import 'package:e_commerce_app/presentation/pages/home/bloc/view_module_bloc/view_module_bloc.dart'
    as _i353;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final datSourceModule = _$DatSourceModule();
    gh.factory<_i992.CartBloc>(() => _i992.CartBloc());
    gh.singleton<_i649.DisplayApi>(() => datSourceModule.displayApi);
    gh.singleton<_i455.DisplayRepository>(
      () => _i644.DisplayRepositoryImpl(gh<_i649.DisplayApi>()),
    );
    gh.singleton<_i757.DisplayUsecase>(
      () => _i757.DisplayUsecase(gh<_i455.DisplayRepository>()),
    );
    gh.factory<_i918.MenuBloc>(
      () => _i918.MenuBloc(gh<_i757.DisplayUsecase>()),
    );
    gh.factory<_i353.ViewModuleBloc>(
      () => _i353.ViewModuleBloc(gh<_i757.DisplayUsecase>()),
    );
    return this;
  }
}

class _$DatSourceModule extends _i988.DatSourceModule {}
