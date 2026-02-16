import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:e_commerce_app/domain/repository/repository.dart';

abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusBymallType({
    required MallType mallType,
  });

  Future<ResponseWrapper<List<ViewModule>>> getViewModuleByTabId({
    required int tabId,
  });
}
