// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewModule _$ViewModuleFromJson(Map<String, dynamic> json) => _ViewModule(
  type: json['type'] as String,
  title: json['title'] as String,
  subTitle: json['subTitle'] as String,
  imageUrl: json['imageUrl'] as String,
  time: (json['time'] as num).toInt(),
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
  tabs: (json['tabs'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ViewModuleToJson(_ViewModule instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'imageUrl': instance.imageUrl,
      'time': instance.time,
      'products': instance.products,
      'tabs': instance.tabs,
    };
