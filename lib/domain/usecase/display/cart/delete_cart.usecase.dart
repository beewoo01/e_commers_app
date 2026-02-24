import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/base/local.usecase.dart';

class DeleteCartUsecase extends LocalUsecase<DisplayRepository> {
  final List<String> productIds;

  DeleteCartUsecase(this.productIds);

  @override
  Future<dynamic> call(DisplayRepository repository) async {
    final result = await repository.deleteCartByProductId(
      productIds: productIds,
    );
    return result.status.isSuccess
        ? Result.success(result.data)
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}
