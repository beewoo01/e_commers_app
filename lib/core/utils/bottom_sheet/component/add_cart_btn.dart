import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _btnHeight = 48;

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final cartBloc = context.watch<CartBloc>().state;

    return GestureDetector(
      onTap: () => context.read<CartListBloc>().add(
        CartListAdded(
          quantity: cartBloc.quantity,
          productInfo: cartBloc.productInfo,
        ),
      ),
      child: Container(
        // TODO 장바구니 담기
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        height: _btnHeight,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: cartBloc.totalPrice.toWon(),
                style: textTheme.titleSmall.semiBold?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              TextSpan(
                text: ' 장바구니 담기',
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
