import 'package:e_commerce_app/data/dto/display/product_info/product_info.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'view_module.dto.freezed.dart';
part 'view_module.dto.g.dart';

@freezed
abstract class ViewModuleDto with _$ViewModuleDto {
  const factory ViewModuleDto({
    @Default('') String? type,
    @Default('') String? title,
    @Default('') String? subTitle,
    @Default('') String? imageUrl,
    @Default(-1) int? time,
    @Default(<ProductInfoDto>[]) List<ProductInfoDto>? products,
  }) = _ViewModuleDto;

  factory ViewModuleDto.fromJson(Map<String, dynamic> json) =>
      _$ViewModuleDtoFromJson(json);
}
