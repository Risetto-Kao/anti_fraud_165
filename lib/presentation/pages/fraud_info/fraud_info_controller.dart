import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/repositories/fraund_info_repo.dart';
import 'package:anti_fraud_165/data/sources/local/fraund_info_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_info_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_info.dart';
import 'package:anti_fraud_165/domain/usecases/get_fraud_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class FraudInfoController extends GetxController {
  var fraudInfo = <FraudInfo>[].obs;
  var failureMessage = "".obs;

  @override
  void onInit() {
    setFraudInfo();
    super.onInit();
  }

  void setFraudInfo() async {
    final getFraudInfo = await GetFraudInfoUseCase(
      repo: FraudInfoRepo(
        api: FraudInfoAPI165(),
        localSource: FraudInfoLocalSource(),
        networkInfo: NetworkInfo(connectivity: Connectivity()),
      ),
    ).call();

    getFraudInfo.fold(
        (l) => failureMessage.value = l.toString(), (r) => fraudInfo.value = r);
  }
}
