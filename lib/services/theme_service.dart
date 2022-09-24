import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = "modeGelap";
  RxBool mode = true.obs;

  saveThemeToBox(bool modeGelap) => _box.write(_key, modeGelap);
  bool isLoadTheme() => _box.read(_key) ?? false;

  ThemeMode get theme => isLoadTheme() ? ThemeMode.dark : ThemeMode.light;
  
  void gantitema() {
    Get.changeThemeMode(isLoadTheme() ? ThemeMode.dark : ThemeMode.light);
    saveThemeToBox(!isLoadTheme());
  }
}
