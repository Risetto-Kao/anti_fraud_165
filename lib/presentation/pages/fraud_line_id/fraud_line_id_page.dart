import 'package:anti_fraud_165/presentation/pages/fraud_line_id/fraud_line_id_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FraudLineIDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search box
        const Text("search"),
        Expanded(child: FraudLineIDSection()),
      ],
    );
  }
}

class FraudLineIDSection extends StatelessWidget {
  final controller = Get.put(FraudLineIDController());

  FraudLineIDSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: controller.fraudLineIDs
                .map((fraudLineID) => ListTile(title: Text(fraudLineID.id)))
                .toList()),
      ),
    );
  }
}
