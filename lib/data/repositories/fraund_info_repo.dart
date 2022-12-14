import 'package:anti_fraud_165/domain/entities/fraud_info.dart';

abstract class FraudInfoInterface {
  Future<List<FraudInfo>> getFraudInfo();
}

class FraudInfoRepo implements FraudInfoInterface {
  @override
  Future<List<FraudInfo>> getFraudInfo() {
    throw UnimplementedError();
  }
}
