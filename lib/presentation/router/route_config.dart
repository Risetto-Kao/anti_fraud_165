import 'package:anti_fraud_165/presentation/pages/about_us/about_us_page.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_info/fraud_info_page.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_line_id/fraud_line_id_page.dart';
import 'package:anti_fraud_165/presentation/pages/fraud_website/fraud_website_page.dart';
import 'package:anti_fraud_165/presentation/pages/home/homepage.dart';
import 'package:anti_fraud_165/presentation/pages/report/report_page.dart';
import 'package:anti_fraud_165/presentation/widgets/app_scaffold.dart';
import 'package:get/get.dart';

class RouteConfig {
  static const String homepage = "/";
  static const String fraudLineID = "/fraud_line_id";
  static const String fraudInfo = "/fraud_info";
  static const String fraudWebsite = "/fraud_website";
  static const String report = "/report";
  static const String aboutAs = "/about_us";

  // static const String user = "/user";
  // static const String settings = "/settings";
  // static const String history = "/history";

  static final List<GetPage> getPages = [
    GetPage(
      name: homepage,
      page: () => const AppScaffold(
        child: Homepage(),
      ),
    ),
    GetPage(
      name: fraudLineID,
      page: () => const AppScaffold(
        child: FraudLineIDPage(),
      ),
    ),
    GetPage(
      name: fraudInfo,
      page: () => const AppScaffold(
        child: FraudInfoPage(),
      ),
    ),
    GetPage(
      name: fraudWebsite,
      page: () => const AppScaffold(
        child: FraudWebsitePage(),
      ),
    ),
    GetPage(
      name: report,
      page: () => const AppScaffold(
        child: ReportPage(),
      ),
    ),
    GetPage(
      name: aboutAs,
      page: () => const AppScaffold(
        child: AboutUsPage(),
      ),
    ),
  ];
}
