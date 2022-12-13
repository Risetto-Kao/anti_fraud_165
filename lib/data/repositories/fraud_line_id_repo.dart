import 'package:anti_fraud_165/data/sources/remote/fraud_line_id_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';

class FraudLineIDRepo {
  Future<List<FraudLineID>> getFraudLineIDs() {
    final FraudLineIDAPI165 api = FraudLineIDAPI165();
    return api.getFraudLineIDs();
  }
}
