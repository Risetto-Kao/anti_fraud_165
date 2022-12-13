import 'package:anti_fraud_165/domain/entities/fraud_line_id.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fraud_line_id_converter.g.dart';

@JsonSerializable()
class FraudLineIDConverter extends FraudLineID {
  FraudLineIDConverter({required super.id, required super.reportDate});

  factory FraudLineIDConverter.fromJson(Map<String, dynamic> json) =>
      _$FraudLineIDConverterFromJson(json);
  Map<String, dynamic> toJson() => _$FraudLineIDConverterToJson(this);

  @override
  String toString() {
    return "id: $id, reportDate: ${reportDate.toString()}";
  }
}
