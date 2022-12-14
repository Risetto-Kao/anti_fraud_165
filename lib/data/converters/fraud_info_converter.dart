import 'package:anti_fraud_165/domain/entities/fraud_info.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fraud_info_converter.g.dart';

@JsonSerializable()
class FraudInfoConverter extends FraudInfo {
  FraudInfoConverter(
      {required super.title, required super.content, required super.postDate});
  factory FraudInfoConverter.fromJson(Map<String, dynamic> json) =>
      _$FraudInfoConverterFromJson(json);
  Map<String, dynamic> toJson() => _$FraudInfoConverterToJson(this);

  @override
  String toString() {
    return "title: $title, content: ${content[0]}, postDate: ${postDate.toString()}";
  }
}
