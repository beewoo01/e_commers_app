import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:e_commerce_app/data/mapper/common_mapper.dart';
import 'package:e_commerce_app/data/mapper/display.mapper.dart';
import 'package:e_commerce_app/domain/model/display/view_module/view_module.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<ResponseWrapper<List<Menu>>> getMenusBymallType({
    required MallType mallType,
  }) async {
    final response = await _displayApi.getMenusByMallType(mallType.name);
    return response.toModel<List<Menu>>(
      response.data?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModule>>> getViewModuleByTabId({
    required int tabId,
    required int page,
  }) async {
    final response = await _displayApi.getViewModulesByTabId(tabId, page);
    return response.toModel<List<ViewModule>>(
      response.data?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}
