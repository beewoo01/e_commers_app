import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/core/utils/exception/common_exception.dart';
import 'package:e_commerce_app/core/utils/logger.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/view_module/get_view_modules.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_module_event.dart';
part 'view_module_state.dart';
part 'view_module_bloc.freezed.dart';

class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()) {
    on<ViewModuleInitialized>(_onViewModuleInitialized);
  }

  Future<void> _onViewModuleInitialized(
    ViewModuleInitialized event,
    Emitter<ViewModuleState> emit,
  ) async {
    CustomLogger.logger.e("_onViewModuleInitialized");
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 2));
    final tabId = event.tabId;
    try {
      final response = await _fetch(tabId);
      response.when(
        success: (viewModules) {
          emit(
            state.copyWith(
              status: Status.success,
              tabId: tabId,
              viewModules: viewModules,
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
          error: CommonException.setError(error),
          status: Status.error,
        ),
      );
    }
  }

  Future<Result<List<ViewModule>>> _fetch(int tabId) async {
    return await _displayUsecase.execute(
      usecase: GetViewModulesUsecase(tabId: tabId),
    );
  }
}
