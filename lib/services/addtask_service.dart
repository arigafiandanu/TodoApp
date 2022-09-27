import 'package:agenda_hari_ini/controller/addTaskController.dart';
import 'package:agenda_hari_ini/database/db_helper.dart';
import 'package:agenda_hari_ini/model/taskModel.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskService extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTask();
  }

  TextEditingController judulC = TextEditingController();
  TextEditingController noteC = TextEditingController();
  var task = Get.put(AddTaskController());

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

  var taskList = <TaskModel>[].obs;

  void validasiData() {
    if (judulC.text.isNotEmpty && noteC.text.isNotEmpty) {
      addTaskToDB();
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

  void addTaskToDB() async {
    int value = await addTask(
      TaskModel(
        title: judulC.text,
        note: noteC.text,
        date: DateFormat.yMd().format(selectdate.value),
        startTime: startTime.value,
        endTime: endTime.value,
        remind: ingkatkanSaya.value,
        repeat: ingkatkanKegiatan.value,
        color: selectColor.value,
        isCompleted: 0,
      ),
    );

    print("data disimpan ke $value");
  }

  Future<int> addTask(TaskModel? taskModel) async {
    return await DBHelper.insert(taskModel);
  }

  void getTask() async {
    print("menggambil data");
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }

  void delete(TaskModel? taskModel) {
    var val = DBHelper.delete(taskModel);
    getTask();
    print(val);
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTask();
  }
}
