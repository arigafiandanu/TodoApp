import 'package:agenda_hari_ini/database/db_helper.dart';
import 'package:agenda_hari_ini/services/theme_service.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:agenda_hari_ini/ui/homepage_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agenda hari ini',
      debugShowCheckedModeBanner: false,
      theme: Customtema.terang,
      darkTheme: Customtema.gelap,
      themeMode: ThemeService().theme,
      home: homepageUi(),
    );
  }
}
