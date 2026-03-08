import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/core/utils/exception/common_exception.dart';
import 'package:e_commerce_app/core/utils/logger.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/model/display/cart/cart.model.dart';
import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
import 'package:e_commerce_app/domain/usecase/display/cart/add_cart_list.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/cart/change_cart_qty.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/cart/delete_cart.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/cart/get_cart_list.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_list_event.dart';

part 'cart_list_state.dart';

part 'cart_list_bloc.freezed.dart';

@injectable
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final DisplayUsecase _displayUsecase;

  CartListBloc(this._displayUsecase) : super(CartListState()) {
    on<CartListInitialized>(_onCartListInitialized);
    on<CartListAdded>(_onCartListAdded);
    on<CartListSelected>(_onCartSelected);
    on<CartListSelectedAll>(_onCartSelectedAll);
    on<CartListDeleted>(_onCartDeleted);
    on<CartListQtyDecreased>(_onCartQtyDecreased);
    on<CartListQtyIncreased>(_onCartQtyIncreased);
  }

  Future<void> _onCartListInitialized(
    CartListInitialized event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _displayUsecase.execute<Result<List<Cart>?>>(
        usecase: GetCartListUsecase(),
      );

      response.when(
        success: (cartList) {
          final selectedProducts = cartList!
              .map((e) => e.product.productId)
              .toList();
          final totalPrice = _calTotalPrice(selectedProducts, cartList);
          print('[test] $totalPrice');

          emit(
            state.copyWith(
              status: Status.success,
              totalPrice: totalPrice,
              cartList: cartList,
              selectedProduct: selectedProducts,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  Future<void> _onCartListAdded(
    CartListAdded event,
    Emitter<CartListState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final cart = Cart(product: event.productInfo, quantity: event.quantity);
      final response = await _displayUsecase.execute<Result<List<Cart>?>>(
        usecase: AddCartListUsecase(cart),
      );

      response.when(
        success: (cartList) {
          final selectedProducts = [...state.selectedProduct];
          final productId = event.productInfo.productId;
          if (selectedProducts.indexWhere((e) => e == productId) == -1) {
            selectedProducts.add(productId);
          }
          final totalPrice = _calTotalPrice(selectedProducts, cartList!);
          emit(
            state.copyWith(
              status: Status.success,
              totalPrice: totalPrice,
              cartList: cartList,
              selectedProduct: selectedProducts,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  Future<void> _onCartDeleted(
    CartListDeleted event,
    Emitter<CartListState> emit,
  ) async {
    try {
      final response = await _displayUsecase.execute<Result<List<Cart>?>>(
        usecase: DeleteCartUsecase(productIds: event.productIds),
      );

      response.when(
        success: (data) {
          final result = data ?? [];
          final List<Cart> cartList = [...result];
          final selectedProducts = cartList
              .map((e) => e.product.productId)
              .toList();
          final totalPrice = _calTotalPrice(selectedProducts, cartList);
          emit(
            state.copyWith(
              cartList: cartList,
              selectedProduct: selectedProducts,
              totalPrice: totalPrice,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  void _onCartSelected(CartListSelected event, Emitter<CartListState> emit) {
    try {
      final selectedProducts = [...state.selectedProduct];
      final productId = event.cart.product.productId;

      final int index = selectedProducts.indexWhere(
        (element) => element == productId,
      );

      if (index == -1) {
        selectedProducts.add(productId);
      } else {
        selectedProducts.removeAt(index);
      }

      final totalPrice = _calTotalPrice(selectedProducts, state.cartList);
      emit(
        state.copyWith(
          totalPrice: totalPrice,
          selectedProduct: selectedProducts,
        ),
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  void _onCartSelectedAll(
    CartListSelectedAll event,
    Emitter<CartListState> emit,
  ) {
    try {
      // 이미 전체 선택이 된 경우 -> 모두 지움
      if (state.cartList.length == state.selectedProduct.length) {
        emit(state.copyWith(totalPrice: 0, selectedProduct: []));

        return;
      }
      final selectedProducts = state.cartList
          .map((e) => e.product.productId)
          .toList();

      final totalPrice = _calTotalPrice(selectedProducts, state.cartList);
      emit(
        state.copyWith(
          totalPrice: totalPrice,
          selectedProduct: selectedProducts,
        ),
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  Future<void> _onCartQtyIncreased(
    CartListQtyIncreased event,
    Emitter<CartListState> emit,
  ) async {
    try {} catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  Future<void> _onCartQtyDecreased(
    CartListQtyDecreased event,
    Emitter<CartListState> emit,
  ) async {
    try {
      final productId = event.cart.product.productId;
      final qty = event.cart.quantity - 1;

      if (qty < 1) return;

      final response = await _displayUsecase.execute<Result<List<Cart>?>>(
        usecase: ChangeCartQtyUsecase(productId: productId, quantity: qty),
      );

      response.when(
        success: (cartList) {
          final totalPrice = _calTotalPrice(state.selectedProduct, cartList!);
          emit(
            state.copyWith(
              status: Status.success,
              totalPrice: totalPrice,
              cartList: cartList,
              selectedProduct: state.selectedProduct,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error.toString());
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  int _calTotalPrice(List<String> selectedIds, List<Cart> carts) {
    int price = 0;
    for (final id in selectedIds) {
      for (final cart in carts) {
        if (id == cart.product.productId) {
          price += cart.quantity * cart.product.price;
        }
      }
    }

    return price;
  }
}
