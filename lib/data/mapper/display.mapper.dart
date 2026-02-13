import 'package:e_commerce_app/data/dto/common/menu/menu.model.dart';
import 'package:e_commerce_app/data/dto/display/menu/menu.dto.dart';

extension MenuX on MenuDto {
  Menu toModel() {
    return Menu(tabId: tabId ?? -1, title: title ?? '');
  }
}
