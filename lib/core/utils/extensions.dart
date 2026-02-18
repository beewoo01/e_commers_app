import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}

extension StringX on String {
  String toSnakeCase() {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');

    return replaceAllMapped(exp, (Match m) => ('_${m.group(0)}')).toLowerCase();
  }
}

extension IntEx on int {
  String toWon() {
    final priceFormat = NumberFormat('###,###,###,###원');
    return priceFormat.format(this);
  }

  String toReview() {
    return this > 9999 ? '9999+' : toString();
  }
}

extension TextStyleEx on TextStyle {
  TextStyle? titleCopywith() {
    return copyWith(
      color: CustomTheme.colorScheme.contentPrimary
    ).regular;
  }

  TextStyle? discountRateCopywith() {
    return copyWith(
      color: CustomTheme.colorScheme.secondary
    ).bold;
  }

  TextStyle? priceCopywith() {
    return copyWith(
      color: CustomTheme.colorScheme.contentPrimary
    ).bold;
  }

  TextStyle? orifinalPriceCopywith() {
    return copyWith(
      color: CustomTheme.colorScheme.contentFourth,
      decoration: TextDecoration.lineThrough
    ).regular;
  }

  TextStyle? reviewCountCopywith() {
    return copyWith(
      color: CustomTheme.colorScheme.contentTertiary,
    ).regular;
  }
}
