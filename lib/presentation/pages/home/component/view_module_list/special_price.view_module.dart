import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/factory/view_module_widget.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/add_cart_button.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/timer_widget.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/view_module_padding.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/view_module_subtitle.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/view_module_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SpecialPriceViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;
  const SpecialPriceViewModule({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: ViewModulePadding(
        child: Column(
          children: [
            ViewModuleTitle(title: info.title),
            ViewModuleSubtitle(subTitle: info.subTitle),
            if (info.time > 0)
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Lottie.asset(
                      AppIcons.lottie_clock,
                      width: 20,
                      delegates: LottieDelegates(
                        values: [
                          ValueDelegate.color(
                            ['Oval', 'Oval', 'Fill 1'],
                            value: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    TimerWidget(
                      endTime: DateTime.fromMillisecondsSinceEpoch(info.time),
                    ),
                  ],
                ),
              ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) =>
                  _SpecialPriceProduct(productInfo: info.products[index]),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: info.products.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecialPriceProduct extends StatelessWidget {
  final ProductInfo productInfo;
  const _SpecialPriceProduct({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 343 / 174,
              child: Image.network(productInfo.imageUrl, fit: BoxFit.cover),
            ),
            AddCartButton(),
          ],
        ),
        SizedBox(height: 9),
        Text(
          productInfo.title,
          style: textTheme.labelLarge
              ?.copyWith(color: colorScheme.contentTertiary)
              .regular,
        ),
        Text(
          productInfo.title,
          style: textTheme.titleMedium?.titleCopywith(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '${productInfo.discountRate.toString()}%',
              style: textTheme.titleLarge?.discountRateCopywith(),
            ),
            const SizedBox(width: 4),
            Text(
              productInfo.price.toWon(),
              style: textTheme.titleLarge?.priceCopywith(),
            ),
            SizedBox(height: 4),
            Text(
              productInfo.originalPrice.toWon(),
              style: textTheme.titleSmall?.orifinalPriceCopywith(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
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
              style: textTheme.labelMedium?.reviewCountCopywith(),
            ),
          ],
        ),
      ],
    );
  }
}
