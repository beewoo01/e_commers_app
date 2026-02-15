import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/data/dto/common/menu/menu.model.dart';
import 'package:flutter/material.dart';

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
          (index) => Column(
            children: [
              Text('mallType: $mallType'),
              Text('mallType: ${menus[index].title}'),
            ],
          ),
        ),
      ),
    );
  }
}
