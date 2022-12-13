import 'package:anti_fraud_165/data/converters/fraud_line_id_converter.dart';

class FraudLineIDLocalStorage {
  // todo: cache the first N line ids
  Future<void> cachePartialFraudLineIDs(
      int couunt, List<FraudLineIDConverter> list) {
    // save to local storage
    return Future.value();
  }
  // todo: get cache from local

  // todo: storage search history
}
