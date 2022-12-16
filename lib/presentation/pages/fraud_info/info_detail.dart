import 'package:anti_fraud_165/domain/entities/fraud_info.dart';
import 'package:anti_fraud_165/presentation/router/route_config.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:anti_fraud_165/presentation/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InfoDetail extends StatelessWidget {
  final FraudInfo info;

  InfoDetail(this.info, {super.key});
  final DateFormat dateFormat = DateFormat("yyyy/MM/dd");

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                info.title,
                style: AppTextStyle.title,
              ),
              trailing: Text(
                dateFormat.format(info.postDate),
                style: AppTextStyle.trailing,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Text(
                  info.content,
                  style: AppTextStyle.subtitle,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () => Get.toNamed(RouteConfig.fraudInfo),
                child: Text(
                  "返回上一頁",
                  style: AppTextStyle.textButton,
                )),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ));
  }
}
