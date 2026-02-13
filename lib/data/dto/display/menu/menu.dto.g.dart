// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) => _MenuDto(
  tabId: (json['tabId'] as num?)?.toInt() ?? -1,
  title: json['title'] as String? ?? '',
);

Map<String, dynamic> _$MenuDtoToJson(_MenuDto instance) => <String, dynamic>{
  'tabId': instance.tabId,
  'title': instance.title,
};
