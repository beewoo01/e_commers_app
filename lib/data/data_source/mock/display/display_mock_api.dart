import 'dart:convert';

import 'package:e_commerce_app/data/data_source/mock/display/display_mock_data.dart';
import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper/response_wrapper.dart';
import 'package:e_commerce_app/data/dto/display/menu/menu.dto.dart';
import 'package:e_commerce_app/data/dto/display/view_module/view_module.dto.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        data: _menuParser(
          mallType == 'market'
              ? DisplayMockData.menusByMarket
              : DisplayMockData.menusByBeauty,
        ),
      ),
    );
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final dynamic decoded = jsonDecode(source);
    if (decoded is! List) {
      return [];
    }

    menus = decoded
        .map((e) => MenuDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return menus;
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
    int tabId,
    int page,
  ) {
    if (page == 4) {
      return Future(
        () => ResponseWrapper(
          status: 'SUCCESS',
          code: '0000',
          message: '',
          data: [],
        ),
      );
    }

    String source = DisplayMockData.getViewModules();

    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _viewModuleParser(source),
      ),
    );
  }

  List<ViewModuleDto> _viewModuleParser(String source) {
    List<ViewModuleDto> viewModules = [];
    final dynamic decoded = jsonDecode(source);
    if (decoded is! List) {
      return [];
    }

    viewModules = decoded
        .map((e) => ViewModuleDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return viewModules;
  }
}
