import 'package:anti_fraud_165/core/config/config.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "若使用此應用程式時出現任何問題，請聯絡 menghueigao@gmail.com",
        style: AppTextStyle.title,
      ),
    );
  }
}
