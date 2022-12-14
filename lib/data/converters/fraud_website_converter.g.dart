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
    FraudWebsiteConverter instance) {
  DateFormat dateFormat = DateFormat("yyyy/MM/dd");

  return <String, dynamic>{
    'WEBSITE_NM': instance.name,
    'WEBURL': instance.url,
    'CNT': instance.cnt.toString(),
    'STA_SDATE': dateFormat.format(instance.startCountDate),
    'STA_EDATE': dateFormat.format(instance.endCountDate),
  };
}
