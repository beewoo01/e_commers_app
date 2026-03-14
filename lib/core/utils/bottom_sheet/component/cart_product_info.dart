import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _imageSize = 48;

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final productInfo = context.watch<CartBloc>().state.productInfo;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Image.network(
            productInfo.imageUrl,
            width: _imageSize,
            height: _imageSize,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productInfo.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.contentPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  productInfo.subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.contentTertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
