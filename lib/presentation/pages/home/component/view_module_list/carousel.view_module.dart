import 'dart:async';

import 'package:e_commerce_app/core/theme/constant/app_colors.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/factory/view_module_widget.dart';
import 'package:flutter/material.dart';

class CarouselViewModule extends StatefulWidget with ViewModuleWidget {
  final ViewModule info;

  const CarouselViewModule({super.key, required this.info});

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  int currentPage = 1;

  PageController pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = periodicTimer();
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  Timer periodicTimer() {
    return Timer.periodic(Duration(seconds: 4), (timer) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductInfo> producs = widget.info.products;

    return AspectRatio(
      aspectRatio: 375 / 340,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (page) {
              setState(() {
                currentPage = page % producs.length + 1;
              });
            },
            itemBuilder: (_, index) {
              String src = producs[index % producs.length].imageUrl;

              return Image.network(src, fit: BoxFit.cover);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PageCountWidget(
                currentPage: currentPage,
                totalPage: producs.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageCountWidget extends StatelessWidget {
  final int currentPage;
  final int totalPage;
  const PageCountWidget({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.inverseSurface.withValues(alpha: 0.74),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Text(
          '$currentPage / $totalPage',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
