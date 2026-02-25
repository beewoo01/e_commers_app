import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/base/local.usecase.dart';

class ChangeCartQtyUsecase extends LocalUsecase<DisplayRepository> {
  final String productId;
  final int quantity;

  ChangeCartQtyUsecase({required this.productId, required this.quantity});

  @override
  Future<dynamic> call(DisplayRepository repository) async {
    final result = await repository.changeCartQuantityByPrdId(
      productId: productId,
      quantity: quantity,
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
