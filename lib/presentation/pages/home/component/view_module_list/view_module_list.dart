import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/presentation/pages/home/bloc/view_module_bloc/view_module_bloc.dart';
import 'package:e_commerce_app/presentation/pages/home/component/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewModuleList extends StatefulWidget {
  final int tabId;

  const ViewModuleList({super.key, required this.tabId});

  @override
  State<ViewModuleList> createState() => _ViewModuleListState();
}

class _ViewModuleListState extends State<ViewModuleList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isEnd) {
      context.read<ViewModuleBloc>().add(ViewModuleFetched());
    }
  }

  bool get _isEnd {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= maxScroll * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<ViewModuleBloc>().add(
        ViewModuleInitialized(tabId: widget.tabId, isRefresh: true),
      ),
      child: BlocBuilder<ViewModuleBloc, ViewModuleState>(
        builder: (_, state) {
          return (state.status == Status.initial || state.viewModules.isEmpty)
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  controller: scrollController,
                  children: [
                    ...state.viewModules,
                    if (state.status.isLoading) LoadingWidget(),

                    ///TODO Footer 부분 오류로 인해 잠시 미뤄둠 원인 찾아서 해결해야함
                    //Footer(),
                  ],
                );
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
