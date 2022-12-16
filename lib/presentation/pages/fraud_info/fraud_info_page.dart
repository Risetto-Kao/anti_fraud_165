import 'package:anti_fraud_165/domain/entities/fraud_info.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_info/fraud_info_controller.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_info/info_detail.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FraudInfoPage extends StatelessWidget {
  final fraudLineIDcontroller = Get.put(FraudInfoController());
  FraudInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (fraudLineIDcontroller.fraudInfo.isEmpty) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "詐騙手法日益新，你我務必要小心",
                  style: TextStyle(fontSize: 26, color: AppColors.primary),
                ),
              ),
              const CircularProgressIndicator()
            ]);
      }
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: fraudLineIDcontroller.fraudInfo
                .map((info) => InfoListTile(info))
                .toList()),
      );
    });
  }
}

class InfoListTile extends StatelessWidget {
  final FraudInfo info;

  const InfoListTile(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        info.title,
        style: AppTextStyle.title,
      ),
      onTap: () => Get.to(InfoDetail(info)),
    );
  }
}
