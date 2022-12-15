import 'package:anti_fraud_165/core/constants/induction.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: AppColors.primary,
        child: const Text(Induction.appTitle));
  }
}
