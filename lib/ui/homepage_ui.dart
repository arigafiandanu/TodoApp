import 'package:agenda_hari_ini/services/addtask_service.dart';
import 'package:agenda_hari_ini/services/datepicker_service.dart';
import 'package:agenda_hari_ini/services/notification_service.dart';
import 'package:agenda_hari_ini/services/theme_service.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:agenda_hari_ini/ui/addTask_ui.dart';
import 'package:agenda_hari_ini/widget/buttomW.dart';
import 'package:agenda_hari_ini/widget/taskbarW.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  final addTaskSer = Get.put(AddTaskService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [
          const TaskbarW(),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: DatePicker(
              DateTime.now(),
              height: Get.height * 0.1,
              width: Get.width * 0.18,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryClr,
              selectedTextColor: Colors.white,
              locale: "id_ID",
              dateTextStyle: tanggalPickerStyle,
              dayTextStyle: hariPickerStyle,
              onDateChange: (selectedDate) {
                addTaskSer.selectdate.value = selectedDate;
              },
            ),
          ),
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
