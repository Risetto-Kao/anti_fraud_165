import 'package:equatable/equatable.dart';

class FraudWebsite extends Equatable {
  const FraudWebsite({
    required this.name,
    required this.url,
    required this.cnt,
    required this.startCountDate,
    required this.endCountDate,
  });

  final String name;
  final String url;
  final int cnt;
  final DateTime startCountDate;
  final DateTime endCountDate;

  @override
  List<Object?> get props => [
        name,
        url,
        cnt,
        startCountDate,
        endCountDate,
      ];
}
