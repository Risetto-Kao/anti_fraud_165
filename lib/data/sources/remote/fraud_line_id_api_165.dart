import 'package:anti_fraud_165/core/constants/constant.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/data/converters/fraud_line_id_converter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FraudLineIDAPI165 {
  Dio dio = Dio();

  Future<List<FraudLineIDConverter>> getFraudLineIDs() async {
    // check url is valid from .env
    var fraudLineIDUrl = dotenv.env["FRAUD_LINE_IDS_URL"];
    if (fraudLineIDUrl == null) throw ConfigException();

    // check status code is ok
    Response response = await dio.get(fraudLineIDUrl);
    if (!StatusCode.success.contains(response.statusCode)) {
      throw ServerException();
    }

    List<FraudLineIDConverter> res = [];

    // check parse process is worked
    try {
      var rawData = response.data;
      List list = (rawData['result']['records']);
      for (var fID in list) {
        res.add(FraudLineIDConverter.fromJson(fID));
      }
    } catch (e) {
      throw ParseException();
    }

    return res;
  }
}
