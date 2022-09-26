import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskService extends GetxController {
  TextEditingController judulC = TextEditingController();
  TextEditingController noteC = TextEditingController();

  void validasiData() {
    if (judulC.text.isNotEmpty && noteC.text.isNotEmpty) {
      Get.back();
    } else if (judulC.text.isEmpty || noteC.text.isEmpty) {
      Get.snackbar(
        "Data kosong",
        "Pastikan semua data terisi",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: whitee,
        icon: const Icon(
          Icons.warning_rounded,
          color: Colors.red,
        ),
        duration: const Duration(seconds: 5),
        borderRadius: 10,
      );
    }
  }
}
