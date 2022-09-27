import 'package:agenda_hari_ini/controller/addTaskController.dart';
import 'package:agenda_hari_ini/model/taskModel.dart';
import 'package:agenda_hari_ini/services/addtask_service.dart';
import 'package:agenda_hari_ini/services/datepicker_service.dart';
import 'package:agenda_hari_ini/services/notification_service.dart';
import 'package:agenda_hari_ini/services/theme_service.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:agenda_hari_ini/ui/addTask_ui.dart';
import 'package:agenda_hari_ini/widget/bottomSheetButton.dart';
import 'package:agenda_hari_ini/widget/buttomW.dart';
import 'package:agenda_hari_ini/widget/taskTileW.dart';
import 'package:agenda_hari_ini/widget/taskbarW.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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

  final addTaskSer = Get.put(AddTaskService(), permanent: true);
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
                setState(() {
                  addTaskSer.selectdate.value = selectedDate;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: addTaskSer.taskList.length,
                itemBuilder: (_, index) {
                  var data = addTaskSer.taskList.length;
                  print("data ada $data");

                  TaskModel taskModel = addTaskSer.taskList[index];
                  print(taskModel.toJson());
                  if (taskModel.repeat == 'Setiap Hari') {
                    notifC.scheduledNotification(
                      int.parse(taskModel.startTime.toString().split(":")[0]),
                      int.parse(taskModel.endTime.toString().split(":")[1]),
                      taskModel,
                    );

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _bottomsheetTask(index);
                                },
                                child: TaskTileW(taskModel),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (taskModel.date ==
                      DateFormat.yMd().format(addTaskSer.selectdate.value)) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _bottomsheetTask(index);
                                },
                                child: TaskTileW(taskModel),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _bottomsheetTask(int index) {
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 5),
        height: addTaskSer.taskList[index].isCompleted == 1
            ? Get.height * 0.24
            : Get.height * 0.32,
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            addTaskSer.taskList[index].isCompleted == 1
                ? Container()
                : BottomSheetButton(
                    ontap: () {
                      addTaskSer
                          .markTaskCompleted(addTaskSer.taskList[index].id!);
                      Get.back();
                    },
                    label: "Selesai",
                    color: blueClr,
                  ),
            const SizedBox(
              height: 10,
            ),
            BottomSheetButton(
              ontap: () {
                addTaskSer.delete(addTaskSer.taskList[index]);
                Get.back();
              },
              label: "Hapus",
              color: RedClr,
            ),
            const SizedBox(
              height: 40,
            ),
            // BottomSheetButton(
            //   ontap: () {
            //     Get.back();
            //   },
            //   label: "tutup",
            //   color: Colors.grey.shade900,
            // )
          ],
        ),
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
