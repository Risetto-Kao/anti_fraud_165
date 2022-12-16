import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "165 反詐騙 關心您",
              style: AppTextStyle.importantInfo,
            )),
        Image.asset("assets/images/anti_fraud.jpeg"),
      ],
    );
  }
}
