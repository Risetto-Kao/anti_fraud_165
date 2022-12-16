import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineIDListTile extends StatelessWidget {
  final FraudLineID fraudLineID;

  LineIDListTile(this.fraudLineID, {super.key});
  final DateFormat dateFormat = DateFormat("yyyy/MM/dd");

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          fraudLineID.id,
          style: AppTextStyle.title,
        ),
        leading: Icon(
          Icons.warning,
          color: AppColors.compared,
        ),
        trailing: Text(
          dateFormat.format(fraudLineID.reportDate),
          style: AppTextStyle.trailing,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade100,
          ),
        ));
  }
}
