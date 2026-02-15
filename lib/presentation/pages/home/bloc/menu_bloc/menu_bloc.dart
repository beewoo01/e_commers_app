import 'dart:math';

import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/core/utils/exception/common_exception.dart';
import 'package:e_commerce_app/core/utils/logger.dart';
import 'package:e_commerce_app/data/dto/common/menu/menu.model.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/menu/get_menus.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_event.dart';

part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc(this._displayUsecase) : super(MenuState()) {
    on<MenuInitialized>(_onMenuInitialized);
  }

  Future<void> _onMenuInitialized(
    MenuInitialized event,
    Emitter<MenuState> emit,
  ) async {
    final mallType = event.mallType;
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 2));

    try {
      final response = await _fetch(mallType);
      response.when(
        success: (menus) {
          emit(
            state.copyWith(
              status: Status.success,
              menus: menus,
              mallType: mallType,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(
        state.copyWith(
          status: Status.error,
          error: CommonException.setError(error),
        ),
      );
    }
  }

  Future<Result<List<Menu>>> _fetch(MallType mallType) async {
    return await _displayUsecase.execute<Result<List<Menu>>>(
      usecase: GetMenusUsecase(mallType: mallType),
    );
  }
}
