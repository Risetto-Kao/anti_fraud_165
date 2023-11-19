import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/data/repositories/fraud_line_id_repo.dart';
import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud_165/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetFraudLineIDUseCase implements UseCase<List<FraudLineID>> {
  final FraudLineIDRepo repo;

  GetFraudLineIDUseCase({required this.repo});

  @override
  Future<Either<Failure, List<FraudLineID>>> call() async {
    final res = await repo.getFraudLineIDs();
    res.fold((l) => null, (r) => r.sort((a, b) => a.id.compareTo(b.id)));
    return res;
  }

  // Future<Either<Failure, String>> search(String s) {
  //   final res = await repo.getFraudLineIDs();
  //   res.fold((l) => null, (r) => r.remove(value));
  // }
}
