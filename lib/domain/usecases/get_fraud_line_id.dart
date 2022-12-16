import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/data/repositories/fraud_line_id_repo.dart';
import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud_165/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetFraudLineID implements UseCase<List<FraudLineID>> {
  final FraudLineIDRepo repo;

  GetFraudLineID({required this.repo});

  @override
  Future<Either<Failure, List<FraudLineID>>> call() {
    // todo: check if need to add async await
    return repo.getFraudLineIDs();
  }
}
