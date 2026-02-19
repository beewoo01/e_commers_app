import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';
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
    required int time,
    required List<ProductInfo> products,
    required List<String> tabs,
  }) = _ViewModule;

factory ViewModule.fromJson(Map<String, dynamic> json)
      => _$ViewModuleFromJson(json);
}
