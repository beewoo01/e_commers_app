import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'category_page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
