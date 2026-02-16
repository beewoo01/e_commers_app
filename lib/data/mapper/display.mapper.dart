import 'package:e_commerce_app/data/dto/display/display.dto.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';

extension MenuX on MenuDto {
  Menu toModel() {
    return Menu(tabId: tabId ?? -1, title: title ?? '');
  }
}

extension ViewModuleX on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(
      type: type,
      title: title,
      subTitle: subTitle,
      imageUrl: imageUrl,
    );
  }
}
