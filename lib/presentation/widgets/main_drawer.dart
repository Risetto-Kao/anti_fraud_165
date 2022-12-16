import 'package:anti_fraud_165/presentation/router/drawer_info.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.support,
      child: ListView(padding: EdgeInsets.zero, children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white))),
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        ...drawerInfo.map((info) => DrawerListTile(info)).toList()
      ]),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final DrawerInfo info;
  const DrawerListTile(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white))),
          child: ListTile(
            leading: Icon(
              info.iconData,
              size: 30,
              color: AppColors.primary,
            ),
            title: Text(
              info.title,
              style: AppTextStyle.drawerTitle,
            ),
            onTap: () => Get.toNamed(info.routeName),
          ),
        ),
      ],
    );
  }
}
