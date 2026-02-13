import 'package:e_commerce_app/data/data_source/mock/display/display_mock_api.dart';
import 'package:e_commerce_app/data/repository_impl/display.repository_impl.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';

import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';

void main() async {
  print('main main main');
  final data = await DisplayRepositoryImpl(
    DisplayMockApi(),
  ).getMenusBymallType(mallType: MallType.market);
  print(data);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: CustomThemeData.themeData,
    );
  }
}
