import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/widgets/counter_btn.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/widgets/svg_icon_button.dart';
import 'package:flutter/material.dart';

const double _imageHeight = 78;

const double _imageWidth = 60;

class CartProductCard extends StatelessWidget {
  // final Cart cart;

  const CartProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
            onPressed: null,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.yellow,
                      width: _imageWidth,
                      height: _imageHeight,
                    ),
                  ],
                ),

                const SizedBox(height: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '7,300원',
                      style: textTheme.titleMedium.bold?.copyWith(
                        color: colorScheme.contentPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CartCountBtn(
                      quantity: 1,
                      decreased: null,
                      increased: null,
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
