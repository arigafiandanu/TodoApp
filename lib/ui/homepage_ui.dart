import 'package:agenda_hari_ini/services/notification_service.dart';
import 'package:agenda_hari_ini/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepageUi extends StatefulWidget {
  const homepageUi({super.key});

  @override
  State<homepageUi> createState() => _homepageUiState();
}

class _homepageUiState extends State<homepageUi> {
  var notifC;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifC = NotifyHelper();
    notifC.initializeNotification();
  }

  final temaC = Get.put(ThemeService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Row(),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          ThemeService().gantitema();
          notifC.displayNotification(
            title: "Tema berubah",
            body: Get.isDarkMode
                ? "Mengganti mode siang"
                : "mengganti mode malam",
          );
          // notifC.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.mode_night_rounded : Icons.light_mode_rounded,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
