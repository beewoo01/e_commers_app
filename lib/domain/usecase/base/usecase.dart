import 'package:e_commerce_app/domain/repository/repository.dart';

abstract class Usecase<T extends Repository> {
  Future call(T repository);
}
