import 'package:e_commerce_app/data/data_source/mock/display/display_mock_api.dart';
import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatSourceModule {

  @singleton
  DisplayApi get displayApi => DisplayMockApi();
}
