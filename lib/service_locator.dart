import 'package:e_commerce_app/data/data_source/mock/display/display_mock_api.dart';
import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/data/repository_impl/display.repository_impl.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/menu_bloc/menu_bloc.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/view_module_bloc/view_module_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setLocator() {
  _data();
  _domain();
  _presentation();
}

void _data() {
  locator.registerSingleton<DisplayApi>(DisplayMockApi());
}

void _domain() {
  // repository
  locator.registerSingleton<DisplayRepository>(
    DisplayRepositoryImpl(locator<DisplayApi>()),
  );

  locator.registerSingleton<DisplayUsecase>(
    DisplayUsecase(locator<DisplayRepository>()),
  );
}

void _presentation() {
  locator.registerFactory(() => MenuBloc(locator<DisplayUsecase>()));

  locator.registerFactory(() => ViewModuleBloc(locator<DisplayUsecase>()));
}
