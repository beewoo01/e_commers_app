import 'package:e_commerce_app/data/entity/cart/cart.entity.dart';
import 'package:e_commerce_app/data/entity/product_info/product_info.entity.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';

void main() async {
  //hive 초기화
  await Hive.initFlutter();
  
  Hive.registerAdapter(ProductInfoEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CartBloc>()..add(CartInitialized())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: CustomThemeData.themeData,
      ),
    );
  }
}
