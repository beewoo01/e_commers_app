import 'package:e_commerce_app/domain/repository/repository.dart';
import 'package:e_commerce_app/domain/usecase/base/usecase.dart';

abstract class LocalUsecase<T extends Repository> extends Usecase<T>{}
