import 'package:e_commerce_app/core/theme/custom/custom_app_bar.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/widgets/svg_icon_button.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/constant/app_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: state.theme.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: AppBar(
              leading: SvgIconButton(
                icon: AppIcons.mainLogo,
                color: state.theme.logoColor,
                padding: 8,
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      CustomAppBarTheme.tabBarRadius,
                    ),
                    color: state.theme.containerColor,
                  ),
                  height: 28,
                  child: DefaultTabController(
                    initialIndex: state.index,
                    length: MallType.values.length,
                    child: TabBar(
                      onTap: (index) =>
                          context.read<MallTypeCubit>().changeMallType(index),
                      labelColor: state.theme.labelColor,
                      labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                      unselectedLabelColor: state.theme.unselectedLabelColor,
                      splashBorderRadius: BorderRadius.all(
                        Radius.circular(CustomAppBarTheme.tabBarRadius),
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: 12),
                      tabAlignment: TabAlignment.center,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomAppBarTheme.tabBarRadius),
                        ),
                        color: state.theme.indicatorColor,
                      ),
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: List.generate(
                        MallType.values.length,
                        (index) => Tab(text: MallType.values[index].toName),
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                SvgIconButton(
                  icon: AppIcons.location,
                  color: state.theme.iconColor,
                ),
                SvgIconButton(
                  icon: AppIcons.cart,
                  color: state.theme.iconColor,
                ),
              ],
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leadingWidth: 86,
            ),
          ),
        );
      },
    );
  }
}
