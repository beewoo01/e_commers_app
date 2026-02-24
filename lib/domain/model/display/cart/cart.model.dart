import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'cart.model.freezed.dart';
part 'cart.model.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    required ProductInfo product,
    required int quantity,
  }) = _Cart;

factory Cart.fromJson(Map<String, dynamic> json)
      => _$CartFromJson(json);
}