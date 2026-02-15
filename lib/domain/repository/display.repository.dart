import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/data/dto/common/menu/menu.model.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:e_commerce_app/domain/repository/repository.dart';

abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusBymallType({
    required MallType mallType,
  });
}
