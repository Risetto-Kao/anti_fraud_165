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
  var searchText = "".obs;
  var failureMessage = "".obs;
  var existLineIDs = <FraudLineID>[];

  @override
  void onInit() {
    setFraudLineID();
    super.onInit();
  }

  @override
  void dispose() {
    // todo: save cache (from user last time watched)
    super.dispose();
  }

  void setFraudLineID() async {
    final getFraudLineID = await GetFraudLineIDUseCase(
      repo: FraudLineIDRepo(
        api: FraudLineIDAPI165(),
        localSource: FraudLineIDLocalSource(),
        networkInfo: NetworkInfo(connectivity: Connectivity()),
      ),
    ).call();
    getFraudLineID.fold((l) => failureMessage.value = l.toString(), (r) {
      // check deep copy vs shallow copy
      existLineIDs = r;
      fraudLineIDs.value = r;
    });
  }

  // ? need to be a use case...?
  void setSearchText(String s) {
    searchText.value = s;
    _search();
  }

  // better -> not efficient
  void _search() {
    List<FraudLineID> newLineIDs = [];
    for (var i in existLineIDs) {
      if (i.id.contains(searchText.value)) newLineIDs.add(i);
    }
    fraudLineIDs.value = newLineIDs;
  }

  bool get isFailure => failureMessage.value != "";
}
