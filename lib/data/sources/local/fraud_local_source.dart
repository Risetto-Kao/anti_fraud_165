abstract class FraudLocalSource {
  Future<List> getCache();
  Future<void> saveCache(int count, List<Object> list);

  Future<List> getSearchHistory();
  Future<void> saveSearchHistory(int count, List<Object> list);
}
