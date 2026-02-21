import 'package:e_commerce_app/core/utils/bottom_sheet/component/add_cart_btn.dart';
import 'package:e_commerce_app/core/utils/bottom_sheet/component/cart_price_info.dart';
import 'package:e_commerce_app/core/utils/bottom_sheet/component/cart_product_info.dart';
import 'package:e_commerce_app/presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (_, state) {
              return Column(
                children: [
                  CartProductInfo(productInfo: state.productInfo),
                  const Divider(height: 1, thickness: 1),
                  CartPriceInfo(
                    productInfo: state.productInfo,
                    quantity: state.quantity,
                  ),
                  AddCartBtn(totalPrice: state.totalPrice),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
