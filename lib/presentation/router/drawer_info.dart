import 'package:anti_fraud_165/presentation/router/route_config.dart';
import 'package:flutter/material.dart';

class DrawerInfo {
  final String title;
  final IconData iconData;
  final String routeName;

  DrawerInfo(this.title, this.iconData, this.routeName);
}

final List<DrawerInfo> drawerInfo = <DrawerInfo>[
  DrawerInfo('首頁', Icons.home, RouteConfig.homepage),

  // todo: Icon need to change to Line
  DrawerInfo('查詢詐騙Line ID', Icons.perm_identity, RouteConfig.fraudLineID),
  DrawerInfo('查詢詐騙網站', Icons.web_sharp, RouteConfig.fraudWebsite),
  DrawerInfo('165 宣導詐騙資訊', Icons.message, RouteConfig.fraudWebsite),
  DrawerInfo('報案/檢舉', Icons.report, RouteConfig.fraudWebsite),
  DrawerInfo('關於我們', Icons.message, RouteConfig.fraudWebsite),
];
