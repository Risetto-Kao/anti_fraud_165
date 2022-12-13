// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_line_id_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FraudLineIDConverter _$FraudLineIDConverterFromJson(Map<String, dynamic> json) {
  DateFormat dateFormat = DateFormat("yyyy/MM/dd");
  return FraudLineIDConverter(
    id: json['帳號'] as String,
    reportDate: dateFormat.parse(json['通報日期'] as String),
  );
}

Map<String, dynamic> _$FraudLineIDConverterToJson(
        FraudLineIDConverter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportDate': instance.reportDate.toIso8601String(),
    };
