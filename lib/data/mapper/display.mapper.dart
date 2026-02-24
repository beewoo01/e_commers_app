import 'package:e_commerce_app/data/dto/display/display.dto.dart';
import 'package:e_commerce_app/data/dto/display/product_info/product_info.dto.dart';
import 'package:e_commerce_app/data/entity/cart/cart.entity.dart';
import 'package:e_commerce_app/data/entity/product_info/product_info.entity.dart';
import 'package:e_commerce_app/domain/model/display/cart/cart.model.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/domain/model/display/product_info/product_info.model.dart';

extension MenuX on MenuDto {
  Menu toModel() {
    return Menu(tabId: tabId ?? -1, title: title ?? '');
  }
}

extension ViewModuleX on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(
      type: type ?? '',
      title: title ?? '',
      subTitle: subTitle ?? '',
      imageUrl: imageUrl ?? '',
      time: time ?? -1,
      products: products?.map((dto) => dto.toModel()).toList() ?? [],
      tabs: tabs ?? [],
    );
  }
}

extension ProductInfoDtoEX on ProductInfoDto {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId ?? '',
      title: title ?? '',
      subTitle: subTitle ?? '',
      imageUrl: imageUrl ?? '',
      price: price ?? -1,
      originalPrice: originalPrice ?? -1,
      discountRate: discountRate ?? -1,
      reviewCount: reviewCount ?? -1,
    );
  }
}

extension ProductInfoEx on ProductInfo {
  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
      productId: productId,
      title: title,
      subtitle: subTitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

/// Entity -> MODEL
extension ProductInfoEntityEx on ProductInfoEntity {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId,
      title: title,
      subTitle: subtitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

extension CartEntityX on CartEntity {
  Cart toModel() {
    return Cart(product: product.toModel(), quantity: quantity);
  }
}

extension CartEx on Cart {
  CartEntity toEntity() {
    return CartEntity(product: product.toEntity(), quantity: quantity);
  }
}
