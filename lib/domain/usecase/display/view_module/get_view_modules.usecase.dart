import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/model/display/view_module/view_module.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/base/remote.usecase.dart';

class GetViewModulesUsecase extends RemoteUsecase<DisplayRepository> {
  final int tabId;
  final int page;

  GetViewModulesUsecase({required this.tabId, required this.page});

  @override
  Future<Result<List<ViewModule>>> call(DisplayRepository repository) async {
    final result = await repository.getViewModuleByTabId(
      tabId: tabId,
      page: page,
    );
    return (result.status == 'SUCCESS')
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}
