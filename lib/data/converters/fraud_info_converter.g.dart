// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_info_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FraudInfoConverter _$FraudInfoConverterFromJson(Map<String, dynamic> json) =>
    FraudInfoConverter(
      title: json['title'] as String,
      content: json['content'] as String,
      postDate: DateTime.parse(json['postDate'] as String),
    );

Map<String, dynamic> _$FraudInfoConverterToJson(FraudInfoConverter instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'postDate': instance.postDate.toIso8601String(),
    };
