import 'package:anti_fraud_165/domain/entities/fraud_website.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class WebsiteList extends StatelessWidget {
  final FraudWebsite fraudWebsite;

  const WebsiteList(this.fraudWebsite, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Icons.warning,
          color: AppColors.compared,
        ),
        title: Text(
          fraudWebsite.name,
          style: AppTextStyle.title,
        ),
        subtitle: Text(
          fraudWebsite.url,
          style: AppTextStyle.subtitle,
          overflow: TextOverflow.ellipsis,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade100,
          ),
        ));
  }
}
