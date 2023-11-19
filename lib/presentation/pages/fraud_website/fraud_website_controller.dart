import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/repositories/fraud_website_repo.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_website_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_website_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_website.dart';
import 'package:anti_fraud_165/domain/usecases/get_fraud_website.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class FraudWebsiteController extends GetxController {
  var fraudWebsites = <FraudWebsite>[].obs;
  var searchText = "".obs;
  var failureMessage = "".obs;
  var existWebsites = <FraudWebsite>[];

  @override
  void onInit() {
    setFraudWebsites();
    super.onInit();
  }

  void setFraudWebsites() async {
    final getFraudWebsite = await GetFraudWebsiteUseCase(
        repo: FraudWebsiteRepo(
      api: FraudWebsiteAPI165(),
      localSource: FraudWebsiteLocalSource(),
      networkInfo: NetworkInfo(connectivity: Connectivity()),
    )).call();

    getFraudWebsite.fold((l) => failureMessage.value = l.toString(), (r) {
      // check
      existWebsites = r;
      fraudWebsites.value = r;
    });
  }

  void setSearchText(String s) {
    searchText.value = s;
    _search();
  }

  void _search() {
    List<FraudWebsite> newWebsites = [];
    for (var i in existWebsites) {
      if (i.name.contains(searchText.value) ||
          i.url.contains(searchText.value)) {
        newWebsites.add(i);
      }
    }
    fraudWebsites.value = newWebsites;
  }

  bool get isFailure => failureMessage.value != "";
}
