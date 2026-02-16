import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:e_commerce_app/data/dto/display/display.dto.dart';
import 'package:retrofit/retrofit.dart';

part 'display.api.g.dart';

@RestApi()
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String? baseUrl}) = _DisplayApi;

  @GET('/api/menus/{mall_type}')
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(
    @Path('mall_type') String mallType,
  );

  @GET('/api/view-modules/{tab_id}')
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
    @Path('tab_id') int mallType,
  );
}
