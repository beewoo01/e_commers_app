import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/data/dto/common/menu/menu.model.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:e_commerce_app/data/mapper/common_mapper.dart';
import 'package:e_commerce_app/data/mapper/display.mapper.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';

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
}
