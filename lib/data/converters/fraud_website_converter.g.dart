// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_website_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FraudWebsiteConverter _$FraudWebsiteConverterFromJson(
        Map<String, dynamic> json) =>
    FraudWebsiteConverter(
      name: json['name'] as String,
      url: json['url'] as String,
      cnt: json['cnt'] as int,
      startCountDate: DateTime.parse(json['startCountDate'] as String),
      endCountDate: DateTime.parse(json['endCountDate'] as String),
    );

Map<String, dynamic> _$FraudWebsiteConverterToJson(
        FraudWebsiteConverter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'cnt': instance.cnt,
      'startCountDate': instance.startCountDate.toIso8601String(),
      'endCountDate': instance.endCountDate.toIso8601String(),
    };
