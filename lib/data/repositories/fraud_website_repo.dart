import 'package:anti_fraud_165/core/constants/constant.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/core/error/failures.dart';
import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_website_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_website_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_website.dart';
import 'package:dartz/dartz.dart';

abstract class FraudWebsiteRepoInterface {
  Future<Either<Failure, List<FraudWebsite>>> getFraudWebsites();
}

class FraudWebsiteRepo implements FraudWebsiteRepoInterface {
  final FraudWebsiteAPI165 api;
  final FraudWebsiteLocalSource localSource;
  final NetworkInfoInterface networkInfo;
  FraudWebsiteRepo(
      {required this.api,
      required this.localSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<FraudWebsite>>> getFraudWebsites() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await api.getFraudWebsites();
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
