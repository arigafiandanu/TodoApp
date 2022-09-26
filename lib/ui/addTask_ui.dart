import 'package:agenda_hari_ini/services/addtask_service.dart';
import 'package:agenda_hari_ini/services/datepicker_service.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:agenda_hari_ini/widget/datePickerW.dart';
import 'package:agenda_hari_ini/widget/textFormW.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskUi extends StatefulWidget {
  const AddTaskUi({super.key});

  @override
  State<AddTaskUi> createState() => _AddTaskUiState();
}

class _AddTaskUiState extends State<AddTaskUi> {
  @override
  Widget build(BuildContext context) {
    final addTaskSer = Get.put(AddTaskService());
    final datepickS = Get.put(DatePickerService());

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
              TextFormW(
                title: "Judul",
                hint: "Masukkan judul Kegiatan",
                controller: addTaskSer.judulC,
                widget: null,
              ),
              TextFormW(
                title: "Note",
                hint: "Masukkan Kegiatan yang dilakukan",
                controller: addTaskSer.noteC,
                widget: null,
              ),
              Obx(
                () => TextFormW(
                  title: "Tanggal",
                  hint: DateFormat.yMd().format(datepickS.selectdate.value),
                  controller: null,
                  widget: const DatePickerW(),
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Expanded(
                      child: TextFormW(
                        title: "Mulai",
                        hint: datepickS.startTime.value,
                        controller: null,
                        widget: IconButton(
                          onPressed: () {
                            datepickS.getTimePicker(true);
                          },
                          icon: const Icon(Icons.access_time_rounded),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => Expanded(
                      child: TextFormW(
                        title: "Selesai",
                        hint: datepickS.endTime.value,
                        controller: null,
                        widget: IconButton(
                          onPressed: () {
                            datepickS.getTimePicker(false);
                          },
                          icon: const Icon(Icons.share_arrival_time_rounded),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Obx(
                () => TextFormW(
                  title: "Inggatkan Saya",
                  hint: "${datepickS.ingkatkanSaya.value} Menit sebelumnya",
                  controller: null,
                  widget: DropdownButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    iconSize: 35,
                    elevation: 4,
                    underline: Container(
                      height: 0,
                    ),
                    items: datepickS.listIngatkanSaya.map((e) {
                      return DropdownMenuItem(
                        value: e.toString(),
                        child: Text(e.toString()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      datepickS.ingkatkanSaya.value = int.parse(newValue!);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
