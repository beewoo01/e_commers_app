import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/menu_bloc/menu_bloc.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/view_module_bloc/view_module_bloc.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/view_module_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalNavBarView extends StatelessWidget {
  const GlobalNavBarView({
    super.key,
    required this.menus,
    required this.mallType,
  });
  final List<Menu> menus;
  final MallType mallType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
          case Status.loading:
            return const Expanded(
              child: Center(child: CircularProgressIndicator()),
            );
          case Status.success:
            return Expanded(
              child: TabBarView(
                children: List.generate(menus.length, (index) {
                  final tabId = menus[index].tabId;
                  return BlocProvider(
                    create: (_) =>
                        getIt<ViewModuleBloc>()
                          ..add(ViewModuleInitialized(tabId: tabId)),
                    child: ViewModuleList(tabId: tabId),
                  );
                }),
              ),
            );
          case Status.error:
          return const Expanded(
              child: Center(child: CircularProgressIndicator()),
            );
        }
      },
    );
  }
}
