import 'package:anti_fraud_165/presentation/pages/fraud_website/fraud_website_controller.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_website/website_list_tile.dart';
import 'package:anti_fraud_165/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FraudWebsitePage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final fraudWebsiteController = Get.put(FraudWebsiteController());

  FraudWebsitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
            hintText: "有疑慮的網站名稱或網址（建議使用網址）",
            controller: _textEditingController,
            onChanged: (value) => fraudWebsiteController.setSearchText(value)),
        FraudWebsiteSection(),
      ],
    );
  }
}

class FraudWebsiteSection extends StatelessWidget {
  final controller = Get.find<FraudWebsiteController>();

  FraudWebsiteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.fraudWebsites.isEmpty) {
        return const CircularProgressIndicator();
      }
      return Expanded(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: controller.fraudWebsites
                  .map((fraudWebsite) => WebsiteList(fraudWebsite))
                  .toList(),
            )),
      );
    });
  }
}
