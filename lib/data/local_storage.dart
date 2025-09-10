import 'package:hive_flutter/hive_flutter.dart';


// will switch to Hive anyway, no need to refactor

enum StorageType { settings, favoriteTopics }

class LocalStorage {
  final List<Box> _boxes = [];

  Future<void> initialize() async {
    await Hive.initFlutter();
    for(StorageType type in StorageType.values) {
      await Hive.openBox(type.name);
      _boxes.add(Hive.box(type.name));
      // print(_boxes[type.index].path);
    }
  }

  bool containsKey(StorageType boxType, dynamic key) {
    return _boxes[boxType.index].containsKey(key);
  }

  dynamic get(StorageType boxType, dynamic key) {
    return _boxes[boxType.index].get(key);
  }

  Future<void> set(StorageType boxType, dynamic key, dynamic value) async {
    await _boxes[boxType.index].put(key, value);
  }

  Future<void> setAll(
    StorageType boxType,
    Map<dynamic, dynamic> entries,
  ) async {
    await _boxes[boxType.index].putAll(entries);
  }

  Future<void> delete(StorageType boxType, dynamic key) async {
    await _boxes[boxType.index].delete(key);
  }

  /******/
  Future<int> add(StorageType boxType, dynamic value) async {
    return await _boxes[boxType.index].add(value);
  }

  dynamic getAt(StorageType boxType, int index) {
    return _boxes[boxType.index].getAt(index);
  }
}
