import 'package:anti_fraud_165/domain/entities/fraud_website.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fraud_website_converter.g.dart';

@JsonSerializable()
class FraudWebsiteConverter extends FraudWebsite {
  FraudWebsiteConverter(
      {required super.name,
      required super.url,
      required super.cnt,
      required super.startCountDate,
      required super.endCountDate});

  factory FraudWebsiteConverter.fromJson(Map<String, dynamic> json) =>
      _$FraudWebsiteConverterFromJson(json);
  Map<String, dynamic> toJson() => _$FraudWebsiteConverterToJson(this);

  @override
  String toString() {
    return "$name: $url -> count: $cnt, date: ${startCountDate.toString()} - ${endCountDate.toString()} ";
  }
}
