import 'package:anti_fraud_165/core/constants/induction.dart';
import 'package:anti_fraud_165/presentation/widgets/header.dart';
import 'package:anti_fraud_165/presentation/widgets/main_drawer.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;
  // final String title;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.support,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: const Text(
          Induction.appName,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Column(
        children: [Expanded(child: widget.child)],
      ),
    );
  }
}
