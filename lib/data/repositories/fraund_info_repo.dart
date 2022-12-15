import 'package:anti_fraud_165/core/constants/constant.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/sources/local/fraund_info_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_info_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_info.dart';
import 'package:dartz/dartz.dart';

abstract class FraudInfoInterface {
  Future<Either<Failure, List<FraudInfo>>> getFraudInfo();
}

class FraudInfoRepo implements FraudInfoInterface {
  final FraudInfoAPI165 api;
  final FraudInfoLocalSource localSource;
  final NetworkInfoInterface networkInfo;
  FraudInfoRepo(
      {required this.api,
      required this.localSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<FraudInfo>>> getFraudInfo() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await api.getFraudInfo();
        await localSource.saveCache(cacheSize, res);
        return Right(res);
      } on ServerException {
        // todo: add logs
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(await localSource.getCache());
      } on CacheExcetion {
        // todo: add logs
        return Left(CacheFailure());
      }
    }
  }
}
