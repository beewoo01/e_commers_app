import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:flutter/material.dart';

class ViewModuleSubtitle extends StatelessWidget {
  final String subTitle;
  const ViewModuleSubtitle({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        subTitle,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.contentTertiary,
        ),
      ),
    );
  }
}
