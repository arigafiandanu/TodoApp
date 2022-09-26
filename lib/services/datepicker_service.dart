import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerService extends GetxController {
  Rx<DateTime> selectdate = DateTime.now().obs;
  RxString endTime = "09.00 pm".obs;
  RxString startTime = DateFormat("hh:mm a").format(DateTime.now()).obs;

  var selectTimeNow = DateFormat("hh:mm a").format(DateTime.now()).toString();
  var selectTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  RxInt ingkatkanSaya = 5.obs;
  List<int> listIngatkanSaya = [5, 10, 15, 30, 60];

  RxString ingkatkanKegiatan = "Tidak".obs;
  List<String> listIngatkanKegiatan = ["Tidak", "Setiap Hari", "Setiap Minggu"];

  RxInt selectColor = 0.obs;

  void getdatepicker() async {
    DateTime? pickdate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2040),
      helpText: "Masukkan Tanggal Acara Berlangsung",
    );
    if (pickdate != null && pickdate != selectdate.value) {
      selectdate.value = pickdate;
    } else {
      print("batal");
    }
  }

  void getTimePicker(bool isStartTime) async {
    var pickTime = await showTimePicker(
      helpText: "Waktu Kegiatan",
      context: Get.context!,
      initialTime: TimeOfDay(
        hour: int.parse(startTime.value.split(":")[0]),
        minute: int.parse(startTime.value.split(":")[1].split(" ")[0]),
      ),
    );
    String? formattime = pickTime?.format(Get.context!);
    if (pickTime == null) {
      print("batal");
    } else if (isStartTime == true) {
      startTime.value = formattime!;
    } else if (isStartTime == false) {
      endTime.value = formattime!;
    }
  }
}
