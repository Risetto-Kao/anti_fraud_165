// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_website_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FraudWebsiteConverter _$FraudWebsiteConverterFromJson(
    Map<String, dynamic> json) {
  DateFormat dateFormat = DateFormat("yyyy/MM/dd");
  return FraudWebsiteConverter(
    name: json['WEBSITE_NM'] as String,
    url: json['WEBURL'] as String,
    cnt: int.parse(json['CNT']),
    startCountDate: dateFormat.parse(json['STA_SDATE'] as String),
    endCountDate: dateFormat.parse(json['STA_EDATE'] as String),
  );
}

Map<String, dynamic> _$FraudWebsiteConverterToJson(
        FraudWebsiteConverter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'cnt': instance.cnt,
      'startCountDate': instance.startCountDate.toIso8601String(),
      'endCountDate': instance.endCountDate.toIso8601String(),
    };
