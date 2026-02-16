import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/logger.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/view_module_bloc/view_module_bloc.dart';
import 'package:e_commerce_app/service_locator.dart';
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
                ViewModuleBloc(locator<DisplayUsecase>())
                  ..add(ViewModuleInitialized(menus[index].tabId)),
            child: const ViewModuleList(),
          ),
        ),
      ),
    );
  }
}

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModuleBloc, ViewModuleState>(
      builder: (_, state) {
        switch (state.status) {
          case Status.initial:
          case Status.loading:
            return const Center(child: CircularProgressIndicator());

          case Status.success:
            return Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.deepOrangeAccent,
                  child: Center(child: Text('${state.tabId}')),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Text(state.viewModules[index].type),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => Divider(thickness: 4),
                    itemCount: state.viewModules.length,
                  ),
                ),
              ],
            );
          case Status.error:
            return Center(child: Text('error'));
        }
      },
    );
  }
}
