import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/dialog/common_dialog.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/menu_bloc/menu_bloc.dart';
import 'package:e_commerce_app/presentation/pages/home/component/global_nav/global_nav_bar.dart';
import 'package:e_commerce_app/presentation/pages/home/component/global_nav/global_nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return BlocProvider(
          create: (_) =>
              getIt<MenuBloc>()..add(MenuInitialized(state)),
          child: HomePageView(),
        );
      },
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MallTypeCubit, MallType>(
      listener: (context, state) =>
          context.read<MenuBloc>().add(MenuInitialized(state)),
      listenWhen: (previous, current) => previous.index != current.index,
      child: BlocConsumer<MenuBloc, MenuState>(
        builder: (_, state) {
          switch (state.status) {
            case Status.initial:
              return Center(child: CircularProgressIndicator());
            case Status.loading:
              return DefaultTabController(
                key: ValueKey<MallType>(state.mallType),
                length: state.menus.length,
                child: Column(
                  children: [
                    GlobalNavBar(state.menus),
                    GlobalNavBarView(
                      menus: state.menus,
                      mallType: state.mallType,
                    ),
                  ],
                ),
              );
            case Status.success:
              return DefaultTabController(
                key: ValueKey<MallType>(state.mallType),
                length: state.menus.length,
                child: Column(
                  children: [
                    GlobalNavBar(state.menus),
                    GlobalNavBarView(
                      menus: state.menus,
                      mallType: state.mallType,
                    ),
                  ],
                ),
              );
            case Status.error:
              return const Center(child: Text('error'));
          }
        },
        listener: (context, state) async {
          if (state.status == Status.error) {
            final bool result =
                (await CommonDialog.errorDialog(context, state.error) ?? false);

            if (result) {
              context.read<MenuBloc>().add(MenuInitialized(MallType.market));
            }
          }
        },

        listenWhen: (prev, curr) => prev.status != curr.status,
      ),
    );
  }
}
