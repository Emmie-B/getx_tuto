import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(_key) ?? false;

  void _saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  void changeTheme() {
    Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
    _saveTheme(!_loadTheme());
  }

  @override
  void onInit() {
    super.onInit();
    Get.changeThemeMode(_loadTheme() ? ThemeMode.dark : ThemeMode.light);
  }
}
