import 'dart:convert';

import 'package:anti_fraud_165/core/constants/induction.dart';
import 'package:anti_fraud_165/core/storage/local_storage.dart';
import 'package:anti_fraud_165/data/converters/fraud_website_converter.dart';
import 'package:anti_fraud_165/data/sources/local/fraud_local_source.dart';
import 'package:anti_fraud_165/domain/entities/fraud_website.dart';

import '../../../core/error/exceptions.dart';

class FraudWebsiteLocalSource implements FraudLocalSource {
  @override
  Future<List<FraudWebsite>> getCache() async {
    final localStorage = LocalStorage(destination: FRAUD_WEBSITES);
    List decode = jsonDecode(await localStorage.readCache());
    List<FraudWebsiteConverter> cache = [];
    for (var d in decode) {
      cache.add(FraudWebsiteConverter.fromJson(d));
    }
    // todo: add log
    return cache;
  }

  @override
  Future<void> saveCache(int count, List<Object> list) async {
    if (list.isEmpty) return;
    if (list[0] is! FraudWebsiteConverter) throw TypeException();
    var cache = list.sublist(0, count) as List<FraudWebsiteConverter>;
    final localStorage = LocalStorage(destination: FRAUD_WEBSITES);
    await localStorage.writeCache(cache);
    // todo: add log
  }

  @override
  Future<List<FraudWebsite>> getSearchHistory() async {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<void> saveSearchHistory(int count, List<Object> list) async {
    if (list.isEmpty) return;
    if (list[0] is! FraudWebsiteConverter) throw TypeException();
    // TODO: implement saveSearchHistory
    throw UnimplementedError();
  }
}
