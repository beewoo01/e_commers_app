import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/domain/model/display/cart/cart.model.dart';
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
    required int page,
  });

  //장바구니 리스트 불러오기
  Future<ResponseWrapper<List<Cart>>> getCartList();

  //장바구니 담기
  Future<ResponseWrapper<List<Cart>>> addCartList({required Cart cart});

  //장바구니 삭제
  Future<ResponseWrapper<List<Cart>>> deleteCartByProductId({
    required List<String> productIds,
  });

  //장바구니 초기화
  Future<ResponseWrapper<List<Cart>>> clearCartList();

  //장바구니 수량 변경하기
  Future<ResponseWrapper<List<Cart>>> changeCartQuantityByPrdId({
    required String productId,
    required int quantity
  });
}
