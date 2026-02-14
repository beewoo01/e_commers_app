import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/base/remote.usecase.dart';

class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future<dynamic> execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_displayRepository);
  }
}
