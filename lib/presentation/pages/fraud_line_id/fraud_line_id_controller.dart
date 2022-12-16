import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/repositories/fraud_line_id_repo.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_line_id_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_line_id_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud_165/domain/usecases/get_fraud_line_id.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class FraudLineIDController extends GetxController {
  var fraudLineIDs = <FraudLineID>[].obs;
  var searchWords = "".obs;
  var failureMessage = "".obs;

  @override
  void onInit() {
    setFraudLineID();
    super.onInit();
  }

  @override
  void dispose() {
    // todo: save cache (since user last time watched)

    super.dispose();
  }

  void setFraudLineID() async {
    final getFraudLineID = await GetFraudLineID(
      repo: FraudLineIDRepo(
        api: FraudLineIDAPI165(),
        localSource: FraudLineIDLocalSource(),
        networkInfo: NetworkInfo(connectivity: Connectivity()),
      ),
    ).call();
    getFraudLineID.fold((l) => failureMessage.value = l.toString(),
        (r) => fraudLineIDs.value = r);
  }

  bool get isFailure => failureMessage.value != "";
}
