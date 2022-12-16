import 'package:anti_fraud_165/core/system/network_info.dart';
import 'package:anti_fraud_165/data/repositories/fraud_line_id_repo.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_line_id_local_source.dart';
import 'package:anti_fraud_165/data/sources/local/fraund_info_local_source.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_info_api_165.dart';
import 'package:anti_fraud_165/data/sources/remote/fraud_line_id_api_165.dart';
import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud_165/domain/usecases/get_fraud_line_id.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class FraudLineIDPage extends StatelessWidget {
  const FraudLineIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          final res = await GetFraudLineID(
              repo: FraudLineIDRepo(
            api: FraudLineIDAPI165(),
            localSource: FraudLineIDLocalSource(),
            networkInfo: NetworkInfo(connectivity: Connectivity()),
          )).call();
          res.fold((l) => print("exception"), (r) => r.forEach(print));
        },
        child: Text("get fraud id"));
  }
}
