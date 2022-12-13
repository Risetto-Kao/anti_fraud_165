class FraudWebsite {
  final String name;
  final String url;
  final int cnt;
  final DateTime startCountDate;
  final DateTime endCountDate;

  const FraudWebsite(
      {required this.name,
      required this.url,
      required this.cnt,
      required this.startCountDate,
      required this.endCountDate});
}
