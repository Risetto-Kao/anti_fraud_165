import 'package:anti_fraud_165/core/constants/constant.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_line_id_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_line_id_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:dartz/dartz.dart';

abstract class FraudLineIDRepoInterface {
  Future<Either<Failure, List<FraudLineID>>> getFraudLineIDs();
}

class FraudLineIDRepo implements FraudLineIDRepoInterface {
  final FraudLineIDAPI165 api;
  final FraudLineIDLocalSource localSource;
  final NetworkInfoInterface networkInfo;
  FraudLineIDRepo(
      {required this.api,
      required this.localSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<FraudLineID>>> getFraudLineIDs() async {
    // if network is available, get data from remote
    // if not, get data from cache
    if (await networkInfo.isConnected) {
      try {
        final res = await api.getFraudLineIDs();
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
