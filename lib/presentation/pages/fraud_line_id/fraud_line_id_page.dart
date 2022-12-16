import 'package:anti_fraud_165/presentation/pages/fraud_line_id/fraud_line_id_controller.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_line_id/line_id_list_tile.dart';
import 'package:anti_fraud_165/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FraudLineIDPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final fraudLineIDcontroller = Get.put(FraudLineIDController());

  FraudLineIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
            hintText: "有疑慮的 Line ID",
            controller: _textEditingController,
            onChanged: (value) => fraudLineIDcontroller.setSearchText(value)),
        FraudLineIDSection(),
      ],
    );
  }
}

class FraudLineIDSection extends StatelessWidget {
  final controller = Get.find<FraudLineIDController>();

  FraudLineIDSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // todo:
        // if (controller.failureMessage.isNotEmpty)

        if (controller.fraudLineIDs.isEmpty) {
          return const CircularProgressIndicator();
        }

        return Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: controller.fraudLineIDs
                    .map((fraudLineID) => LineIDListTile(fraudLineID))
                    .toList()),
          ),
        );
      },
    );
  }
}
