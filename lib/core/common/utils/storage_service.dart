import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedStorage {}

abstract class HiveStorage {}

abstract class  StorageService<T> {
  bool? getBool(String key);

  String? getString(String key);

  int? getInt(String key);

  Future<List<String>?> getStringList(String key);

  Future setStringList(String key, List<String> value);

  Future setBool(String key, bool value);

  Future setString(String key, String value);

  Future setInt(String key, int value);

  remove(String key);

  factory StorageService.hive(Box<dynamic> box) => StorageServiceHiveImpl(box);

  factory StorageService.shared(SharedPreferences sharedPreferences) =>
      StorageServiceSharedImp(sharedPreferences);
}

class StorageServiceHiveImpl<T extends SharedStorage>
    implements StorageService<T> {
  final Box<dynamic>? _box;

  StorageServiceHiveImpl(Box<dynamic> box) : _box = box;

  @override
  bool? getBool(String key) {
    return _box!.get(key);
  }

  @override
  int? getInt(String key) {
    return _box!.get(key);
  }

  @override
  String? getString(String key) {
    return _box!.get(key);
  }

  @override
  Future setBool(String key, bool value) async {
    await _box!.put(key, value);
  }

  @override
  Future setInt(String key, int value) async {
    await _box!.put(key, value);
  }

  @override
  Future setString(String key, String value) async {
    await _box!.put(key, value);
  }

  @override
  remove(String key) async {
    await _box!.delete(key);
  }

  @override
  Future<List<String>?> getStringList(String key) {
    return _box!.get(key);
  }

  @override
  Future setStringList(String key, List<String> value) async {
    await _box!.put(key, value);
  }
}

class StorageServiceSharedImp<T extends SharedStorage>
    implements StorageService<T> {
  final SharedPreferences? _sharedPreferences;

  StorageServiceSharedImp(SharedPreferences sharedPreferences)
      : _sharedPreferences = sharedPreferences;

  @override
  bool? getBool(String key) {
    return _sharedPreferences!.getBool(key);
  }

  @override
  int? getInt(String key) {
    return _sharedPreferences!.getInt(key);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  @override
  Future setBool(String key, bool value) async {
    await _sharedPreferences!.setBool(key, value);
  }

  @override
  Future setInt(String key, int value) async {
    await _sharedPreferences!.setInt(key, value);
  }

  @override
  Future setString(String key, String value) async {
    await _sharedPreferences!.setString(key, value);
    await _sharedPreferences!.reload();
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    await _sharedPreferences!.reload();
    return _sharedPreferences!.getStringList(key);
  }

  @override
  remove(String key) async {
    await _sharedPreferences!.remove(key);
  }

  @override
  Future setStringList(String key, List<String> value) async {
    await _sharedPreferences!.setStringList(key, value);
    await _sharedPreferences!.reload();
  }
}
