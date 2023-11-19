import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/data/repositories/fraud_website_repo.dart';
import 'package:anti_fraud_165/domain/entities/fraud_website.dart';
import 'package:anti_fraud_165/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetFraudWebsiteUseCase implements UseCase<List<FraudWebsite>> {
  final FraudWebsiteRepo repo;

  GetFraudWebsiteUseCase({required this.repo});

  @override
  Future<Either<Failure, List<FraudWebsite>>> call() async {
    return await repo.getFraudWebsites();
  }
}
