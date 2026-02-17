import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';

void main() async {
  configureDependencies();
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
