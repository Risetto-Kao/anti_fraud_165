import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/data/repositories/fraund_info_repo.dart';
import 'package:anti_fraud_165/domain/entities/fraud_info.dart';
import 'package:anti_fraud_165/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetFraudInfoUseCase implements UseCase<List<FraudInfo>> {
  final FraudInfoRepo repo;

  GetFraudInfoUseCase({required this.repo});

  @override
  Future<Either<Failure, List<FraudInfo>>> call() async {
    return await repo.getFraudInfo();
  }
}
