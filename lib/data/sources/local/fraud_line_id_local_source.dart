import 'dart:convert';
import 'package:anti_fraud_165/core/constants/induction.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/core/storage/local_storage.dart';
import 'package:anti_fraud_165/data/converters/fraud_line_id_converter.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_local_source.dart';

class FraudLineIDLocalSource implements FraudLocalSource {
  @override
  Future<List<FraudLineIDConverter>> getCache() async {
    final localStorage = LocalStorage(destination: FRAUD_LINE_IDS);
    List decode = jsonDecode(await localStorage.readCache());
    List<FraudLineIDConverter> cache = [];
    for (var d in decode) {
      cache.add(FraudLineIDConverter.fromJson(d));
    }
    // todo: add log
    return cache;
  }

  @override
  Future<void> saveCache(int count, List list) async {
    if (list.isEmpty) return;
    if (list[0] is! FraudLineIDConverter) throw TypeException();
    var cache = list.sublist(0, count) as List<FraudLineIDConverter>;
    final localStorage = LocalStorage(destination: FRAUD_LINE_IDS);
    await localStorage.writeCache(cache);
    // todo: add log
  }

  @override
  Future<List<FraudLineIDConverter>> getSearchHistory() {
    // todo: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<void> saveSearchHistory(int count, List list) async {
    if (list.isEmpty) return;
    if (list[0] is! FraudLineIDConverter) throw TypeException();
    // todo: implement saveSearchHistory
    return;
  }
}
