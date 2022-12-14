import 'package:anti_fraud_165/core/constants/constant.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/data/converters/fraud_info_converter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FraudInfoAPI165 {
  Dio dio = Dio();

  Future<List<FraudInfoConverter>> getFraudWebsites() async {
    // check url is valid from .env
    final fraudInfoUrl = dotenv.env["FRAUD_INFORMATION_URL"];
    if (fraudInfoUrl == null) throw ConfigException();

    // check status code is ok
    Response response = await dio.get(fraudInfoUrl);
    if (!StatusCode.success.contains(response.statusCode)) {
      throw ServerException();
    }

    List<FraudInfoConverter> res = [];

    // check parse process is worked
    try {
      var rawData = response.data;
      List list = rawData['result']['records'];

      for (var fInfo in list) {
        res.add(FraudInfoConverter.fromJson(fInfo));
      }
    } catch (e) {
      throw ParseException();
    }
    return res;
  }
}
