import 'package:anti_fraud_165/core/config/config.dart';
import 'package:anti_fraud_165/presentation/router/route_config.dart';
import 'package:anti_fraud_165/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:get/route_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Logging
  await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: ["device", "network", "errors"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "logs",
      logsExportDirectoryName: "logs/exported",
      debugFileOperations: true,
      isDebuggable: true);

  // initialize .env
  await dotenv.load(fileName: ".env");

  // set dev mode
  // Config.instance.setMode(DevMode.SimulateNetworkDisconneted);
  Config.instance.setMode(DevMode.Release);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.homepage,
      getPages: RouteConfig.getPages,
      theme: ThemeData(
          primaryColor: AppColors.primary,
          secondaryHeaderColor: AppColors.secondary),
    );
  }
}
