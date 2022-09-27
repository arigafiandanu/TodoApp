import 'package:agenda_hari_ini/services/addtask_service.dart';
import 'package:agenda_hari_ini/services/datepicker_service.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:agenda_hari_ini/widget/buttomW.dart';
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
                  hint: DateFormat.yMd().format(addTaskSer.selectdate.value),
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
                        hint: addTaskSer.startTime.value,
                        controller: null,
                        widget: IconButton(
                          onPressed: () {
                            addTaskSer.getTimePicker(true);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
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
                        hint: addTaskSer.endTime.value,
                        controller: null,
                        widget: IconButton(
                          onPressed: () {
                            addTaskSer.getTimePicker(false);
                          },
                          icon: const Icon(
                            Icons.share_arrival_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Obx(
                () => TextFormW(
                  title: "Inggatkan Saya",
                  hint: "${addTaskSer.ingkatkanSaya.value} Menit sebelumnya",
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
                    items: addTaskSer.listIngatkanSaya.map((e) {
                      return DropdownMenuItem(
                        value: e.toString(),
                        child: Text(e.toString()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      addTaskSer.ingkatkanSaya.value = int.parse(newValue!);
                    },
                  ),
                ),
              ),
              Obx(
                () => TextFormW(
                  title: "Inggatkan Saya Kembali",
                  hint: addTaskSer.ingkatkanKegiatan.value,
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
                    items: addTaskSer.listIngatkanKegiatan.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (String? kegiatan) {
                      addTaskSer.ingkatkanKegiatan.value = kegiatan!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Colors",
                        style: titleStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => Wrap(
                          children: List.generate(
                            3,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  addTaskSer.selectColor.value = index;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: index == 0
                                        ? blueClr
                                        : index == 1
                                            ? amberClr
                                            : RedClr,
                                    child: addTaskSer.selectColor.value == index
                                        ? const Icon(
                                            Icons.done_rounded,
                                            color: Colors.white,
                                            size: 16,
                                          )
                                        : Container(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Tombol(
                    label: "Tambah Kegiatan",
                    ontap: () {
                      addTaskSer.validasiData();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
