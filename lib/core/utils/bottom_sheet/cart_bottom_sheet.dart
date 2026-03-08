import 'package:e_commerce_app/core/utils/bottom_sheet/component/add_cart_btn.dart';
import 'package:e_commerce_app/core/utils/bottom_sheet/component/cart_price_info.dart';
import 'package:e_commerce_app/core/utils/bottom_sheet/component/cart_product_info.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return SafeArea(
        child: BlocListener<CartListBloc, CartListState>(
          listener: (_, state) {
            if (state.status.isError) {
              context.pop(!state.status.isError);
            }

            if (context.canPop()) {
              context.pop();
              //CommonSnackBar.errorEnackBar(context, error: state.error);
            }
          },
          listenWhen: (previous, current) => previous.status != current.status,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CartProductInfo(),
                Divider(height: 1, thickness: 1),
                CartPriceInfo(),
                AddCartBtn(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
