import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/add_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final double imageAspect;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final TextStyle? originalPriceStyle;
  final TextStyle? reviewStyle;
  final bool needShowReviewCount;

  const ProductCardWidget({
    super.key,
    required this.productInfo,
    required this.imageAspect,
    this.titleStyle,
    this.priceStyle,
    this.originalPriceStyle,
    this.reviewStyle,
    required this.needShowReviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: imageAspect,
              child: Image.network(productInfo.imageUrl, fit: BoxFit.cover),
            ),
            AddCartButton(),
          ],
        ),
        SizedBox(height: 9),
        Text(
          productInfo.title,
          style: titleStyle?.titleCopywith(),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 1),
        Row(
          children: [
            Text(
              '${productInfo.discountRate.toString()}%',
              style: priceStyle?.discountRateCopywith(),
            ),
            const SizedBox(width: 4),
            Text(productInfo.price.toWon(), style: priceStyle?.priceCopywith()),
          ],
        ),
        SizedBox(height: 2),
        Text(
          productInfo.originalPrice.toWon(),
          style: priceStyle?.orifinalPriceCopywith(),
        ),
        SizedBox(height: 8),
        if (needShowReviewCount)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.chat,
                  width: 13,
                  height: 13,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.contentTertiary,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '후기 ${productInfo.reviewCount.toReview()}',
                  style: reviewStyle?.reviewCountCopywith(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
