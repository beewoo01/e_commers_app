import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/factory/view_module_widget.dart';
import 'package:flutter/material.dart';

class BannerViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;
  const BannerViewModule({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return info.imageUrl.isNotEmpty
        ? AspectRatio(
            aspectRatio: 375 / 79,
            child: Image.network(info.imageUrl, fit: BoxFit.fitWidth),
          )
        : const SizedBox.shrink();
  }
}
