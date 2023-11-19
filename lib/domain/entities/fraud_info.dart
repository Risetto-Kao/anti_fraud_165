import 'package:equatable/equatable.dart';

class FraudInfo extends Equatable {
  const FraudInfo({
    required this.title,
    required this.content,
    required this.postDate,
  });

  final String title;
  final String content;
  final DateTime postDate;

  @override
  List<Object?> get props => [
        title,
        content,
        postDate,
      ];
}
