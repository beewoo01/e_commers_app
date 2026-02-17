import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';
import 'service_locator.dart';

void main() async {
  setLocator();

  //final data = await locator<DisplayApi>().getViewModulesByTabId(10001);
  //print(data);
  // try {
  //   final test = await DisplayMockApi().getMenusByMallType('market');
  //   CustomLogger.logger.e(test);
  // } catch (error) {
  //   final errorData = CommonException.setError(error);
  //   CustomLogger.logger.e(
  //     'errorData.code: ${errorData.code}, errorData message: ${errorData.message}, errorData.status: ${errorData.status}',
  //   );
  // }

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
