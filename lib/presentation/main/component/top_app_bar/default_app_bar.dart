import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/bottom_nav_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key, required this.bottomNav});
  final BottomNav bottomNav;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return Container(
          color: state.isMarket
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: AppBar(
              title: Text(
                bottomNav.toName,
                style: TextStyle(
                  color: state.isMarket
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.contentPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
          ),
        );
      },
    );
  }
}
