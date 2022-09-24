import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskUi extends StatelessWidget {
  const AddTaskUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            // notifC.scheduledNotification();
          },
          child: Icon(
            Icons.arrow_back_ios,
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
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Tambah Kegiatan",
                style: headingStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
