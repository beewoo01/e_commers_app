import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_module.freezed.dart';
part 'view_module.g.dart';

@freezed
abstract class ViewModule with _$ViewModule {
  const factory ViewModule({
    required String type,
    required String title,
    required String subTitle,
    required String imageUrl,
  }) = _ViewModule;

factory ViewModule.fromJson(Map<String, dynamic> json)
      => _$ViewModuleFromJson(json);
}