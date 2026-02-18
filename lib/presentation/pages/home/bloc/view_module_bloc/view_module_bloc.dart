import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/core/utils/exception/common_exception.dart';
import 'package:e_commerce_app/core/utils/logger.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/model/display/display.model.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/view_module/get_view_modules.usecase.dart';
import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/factory/view_module_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'view_module_event.dart';
part 'view_module_state.dart';
part 'view_module_bloc.freezed.dart';

EventTransformer<E> _throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()) {
    on<ViewModuleInitialized>(_onViewModuleInitialized);
    on<ViewModuleFetched>(
      _onViewModuleFetched,
      transformer: _throttleDroppable(Duration(milliseconds: 400)),
    );
  }

  Future<void> _onViewModuleInitialized(
    ViewModuleInitialized event,
    Emitter<ViewModuleState> emit,
  ) async {
    final tabId = event.tabId;
    CustomLogger.logger.e('_onViewModuleInitialized');
    if (event.isRefresh) {
      emit(
        state.copyWith(
          status: Status.initial,
          currentPage: 1,
          isEndOfPage: false,
          viewModules: [],
        ),
      );
    }

    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 1));
    CustomLogger.logger.e('_onViewModuleInitialized');
    try {
      final response = await _fetch(tabId: tabId);
      response.when(
        success: (data) {
          CustomLogger.logger.e('_onViewModuleInitialized data is ${data}');
          ViewModuleFactory viewModuleFactory = ViewModuleFactory();
          final List<Widget> viewModules = data
              .map((e) => viewModuleFactory.textToWidget(e))
              .toList();

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

  Future<Result<List<ViewModule>>> _fetch({
    required int tabId,
    int page = 1,
  }) async {
    return await _displayUsecase.execute(
      usecase: GetViewModulesUsecase(tabId: tabId, page: page),
    );
  }

  Future<void> _onViewModuleFetched(
    ViewModuleFetched event,
    Emitter<ViewModuleState> emit,
  ) async {
    CustomLogger.logger.e("[test] fetched call");
    if (state.isEndOfPage) return;
    final nextPage = state.currentPage + 1;
    final tabId = state.tabId;

    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(seconds: 1));

    try {
      final response = await _fetch(tabId: tabId, page: nextPage);
      response.when(
        success: (data) {
          CustomLogger.logger.e("[test] data is ${data}");
          if (data.isEmpty) {
            emit(
              state.copyWith(
                status: Status.success,
                currentPage: nextPage,
                isEndOfPage: true,
              ),
            );

            return;
          }
          final List<Widget> viewModules = [...state.viewModules];

          ViewModuleFactory viewModuleFactory = ViewModuleFactory();

          viewModules.addAll(
            List.generate(
              data.length,
              (index) => viewModuleFactory.textToWidget(data[index]),
            ),
          );

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
}
