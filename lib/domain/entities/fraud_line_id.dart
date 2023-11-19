import 'package:equatable/equatable.dart';

class FraudLineID extends Equatable {
  const FraudLineID({
    required this.id,
    required this.reportDate,
  });

  final String id;
  final DateTime reportDate;

  @override
  List<Object?> get props => [
        id,
        reportDate,
      ];
}
