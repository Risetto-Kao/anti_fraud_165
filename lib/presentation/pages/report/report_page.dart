import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final npa165Url = dotenv.env['NPA_165_URL'];
    if (npa165Url == null) throw ConfigException();
    return Center(
      child: TextButton(
        onPressed: () => _launchInBrowser(Uri.parse(npa165Url)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "點此前往165官網",
            style: AppTextStyle.importantInfo,
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
