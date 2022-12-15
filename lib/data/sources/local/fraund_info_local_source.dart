import 'dart:convert';

import 'package:anti_fraud_165/core/constants/induction.dart';
import 'package:anti_fraud_165/core/error/exceptions.dart';
import 'package:anti_fraud_165/core/storage/local_storage.dart';
import 'package:anti_fraud_165/data/converters/fraud_info_converter.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_local_source.dart';
import 'package:anti_fraud_165/domain/entities/fraud_info.dart';

class FraudInfoLocalSource implements FraudLocalSource {
  @override
  Future<List<FraudInfo>> getCache() async {
    final localStorage = LocalStorage(destination: FRAUD_INFORMATION);
    List decode = jsonDecode(await localStorage.readCache());
    List<FraudInfoConverter> cache = [];
    for (var d in decode) {
      cache.add(FraudInfoConverter.fromJson(d));
    }
    // todo: add log
    return cache;
  }

  @override
  Future<void> saveCache(int count, List<Object> list) async {
    if (list.isEmpty) return;
    if (list[0] is! FraudInfoConverter) throw TypeException();
    var cache = list.sublist(0, count) as List<FraudInfoConverter>;
    final localStorage = LocalStorage(destination: FRAUD_INFORMATION);
    await localStorage.writeCache(cache);
    // todo: add log
  }

  @override
  Future<List<FraudInfo>> getSearchHistory() async {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<void> saveSearchHistory(int count, List<Object> list) async {
    if (list.isEmpty) return;
    if (list[0] is! FraudInfoConverter) throw TypeException();
    // TODO: implement saveSearchHistory
    throw UnimplementedError();
  }
}
