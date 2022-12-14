import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  final String destination;
  LocalStorage({required this.destination});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<bool> isExist() async {
    final path = await _localPath;
    return File('$path/$destination.json').exists();
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$destination.json');
  }

  Future<File> writeCache(List list) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(list));
  }

  Future<String> readCache() async {
    final file = await _localFile;
    return file.readAsString();
  }
}
