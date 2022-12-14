import 'package:anti_fraud_165/data/converters/fraud_line_id_converter.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_line_id_api_165.dart';

abstract class FraudLineIDRepoInterface {
  Future<List<FraudLineIDConverter>> getFraudLineIDs();
}

class FraudLineIDRepo implements FraudLineIDRepoInterface {
  @override
  Future<List<FraudLineIDConverter>> getFraudLineIDs() {
    final FraudLineIDAPI165 api = FraudLineIDAPI165();
    return api.getFraudLineIDs();
  }
}
