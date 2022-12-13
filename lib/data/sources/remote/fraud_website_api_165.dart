import 'package:anti_fraud_165/core/constants/constant.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/data/converters/fraud_website_converter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FraudWebsiteAPI165 {
  Dio dio = Dio();

  Future<List<FraudWebsiteConverter>> getFraudWebsites() async {
    // check url is valid from .env
    final fraudWebsiteUrl = dotenv.env["FRAUD_WEBSITES_URL"];
    if (fraudWebsiteUrl == null) throw ConfigException();

    // check status code is ok
    Response response = await dio.get(fraudWebsiteUrl);
    if (!StatusCode.success.contains(response.statusCode)) {
      throw ServerException();
    }

    List<FraudWebsiteConverter> res = [];

    // check parse process is worked
    try {
      var rawData = response.data;
      List list = rawData['result']['records'];
      list.removeAt(0);
      for (var fWebsite in list) {
        res.add(FraudWebsiteConverter.fromJson(fWebsite));
      }
    } catch (e) {
      throw ParseException();
    }
    return res;
  }
}
