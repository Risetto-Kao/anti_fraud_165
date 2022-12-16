import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
