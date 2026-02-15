import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/base/remote.usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future<T> execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_displayRepository) as T;
  }
}
