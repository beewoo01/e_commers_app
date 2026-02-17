import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
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
    return Expanded(
      child: TabBarView(
        children: List.generate(
          menus.length,
          (index) => BlocProvider(
            create: (_) =>
                getIt<ViewModuleBloc>()
                  ..add(ViewModuleInitialized(menus[index].tabId)),
            child: const ViewModuleList(),
          ),
        ),
      ),
    );
  }
}
