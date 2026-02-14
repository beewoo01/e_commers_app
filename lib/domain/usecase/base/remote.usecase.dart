import 'package:e_commerce_app/domain/repository/repository.dart';

abstract class RemoteUsecase<T extends Repository> {
  Future<dynamic> call(T repository);
}
