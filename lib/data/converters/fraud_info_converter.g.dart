// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_info_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FraudInfoConverter _$FraudInfoConverterFromJson(Map<String, dynamic> json) {
  DateFormat dateFormat = DateFormat("yyyy/MM/dd HH:mm");
  return FraudInfoConverter(
    title: json['標題'] as String,
    content: json['發佈內容'] as String,
    postDate: dateFormat.parse(json['發佈時間'] as String),
  );
}

Map<String, dynamic> _$FraudInfoConverterToJson(FraudInfoConverter instance) {
  DateFormat dateFormat = DateFormat("yyyy/MM/dd HH:mm");

  return <String, dynamic>{
    '標題': instance.title,
    '發佈內容': instance.content,
    '發佈時間': dateFormat.format(instance.postDate),
  };
}
