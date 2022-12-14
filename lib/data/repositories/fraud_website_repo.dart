import 'package:anti_fraud_165/domain/entities/fraud_website.dart';

abstract class FraudWebsiteRepoInterface {
  Future<List<FraudWebsite>> getFraudWebsites();
}

class FraudWebsiteRepo implements FraudWebsiteRepoInterface {
  @override
  Future<List<FraudWebsite>> getFraudWebsites() {
    throw Exception();
  }
}
