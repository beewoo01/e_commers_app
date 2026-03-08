import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/core/utils/widgets/counter_btn.dart';
import 'package:e_commerce_app/domain/model/display/cart/cart.model.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/widgets/svg_icon_button.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _imageHeight = 78;

const double _imageWidth = 60;

class CartProductCard extends StatelessWidget {
  final Cart cart;

  const CartProductCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final productId = cart.product.productId;

    final isSelected = context.select(
      (CartListBloc bloc) => bloc.state.selectedProduct,
    );

    // final productId = cart.product.productId;

    // final bloc = context.read<CartListBloc>();
    // final isSelected = context.select(
    //   (CartListBloc bloc) => bloc.state.selectedProduct.contains(productId),
    // );

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgIconButton(
            icon: AppIcons.checkMarkCircle,
            color: colorScheme.primary,
            onPressed: () =>
                context.read<CartListBloc>().add(CartListSelected(cart: cart)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        cart.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall?.copyWith(),
                      ),
                    ),

                    Center(
                      child: SvgIconButton(
                        icon: AppIcons.close,
                        color: colorScheme.contentTertiary,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 11),
                Row(
                  children: [
                    Image.network(
                      cart.product.imageUrl,
                      width: _imageWidth,
                      height: _imageHeight,
                    ),
                    const SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.product.price.toWon(),
                          style: textTheme.titleMedium.bold?.copyWith(
                            color: colorScheme.contentPrimary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CartCountBtn(
                          quantity: cart.quantity,
                          decreased: () => context.read<CartListBloc>().add(
                            CartListQtyDecreased(cart: cart),
                          ),
                          increased: () => context.read<CartListBloc>().add(
                            CartListQtyIncreased(cart: cart),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Divider(height: 1, thickness: 1, color: colorScheme.outline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
