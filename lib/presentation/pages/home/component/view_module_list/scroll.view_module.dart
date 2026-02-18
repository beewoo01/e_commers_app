import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
import 'package:e_commerce_app/domain/model/display/view_module/view_module.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/factory/view_module_widget.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/product_card.component.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/view_module_padding.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/view_module_subtitle.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/view_module_title.dart';
import 'package:flutter/material.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;
  const ScrollViewModule({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewModulePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewModuleTitle(title: info.title),
              if (info.subTitle.isNotEmpty)
                ViewModuleSubtitle(subTitle: info.subTitle),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 50),
          child: _ImageList(products: info.products),
        ),
      ],
    );
  }
}

class _ImageList extends StatelessWidget {
  final List<ProductInfo> products;
  const _ImageList({required this.products});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 305,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: Constants.horizontalPadding,
        itemBuilder: (_, index) {
          final productInfo = products[index];
          return AspectRatio(
            aspectRatio: 150 / 305,
            child: LargeProductCard(context: context, productInfo: productInfo),
          );
        },
        separatorBuilder: (_, _) => SizedBox(width: 8),
        itemCount: products.length,
      ),
    );
  }
}
