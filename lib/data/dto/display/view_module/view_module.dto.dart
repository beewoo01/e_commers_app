import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'view_module.dto.freezed.dart';
part 'view_module.dto.g.dart';

@freezed
abstract class ViewModuleDto with _$ViewModuleDto {
  const factory ViewModuleDto({
    @Default('') String type,
    @Default('') String title,
    @Default('') String subTitle,
    @Default('') String imageUrl,
    
  }) = _ViewModuleDto;

factory ViewModuleDto.fromJson(Map<String, dynamic> json)
      => _$ViewModuleDtoFromJson(json);
}