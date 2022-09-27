import 'package:agenda_hari_ini/services/addtask_service.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:agenda_hari_ini/ui/addTask_ui.dart';
import 'package:agenda_hari_ini/widget/buttomW.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskbarW extends StatelessWidget {
  const TaskbarW({super.key});

  @override
  Widget build(BuildContext context) {
    final addtaskSer = Get.put(AddTaskService());
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                'Hari ini',
                style: headingStyle,
              )
            ],
          ),
          Tombol(
            label: " + Tambah Acara",
            ontap: () async {
              await Get.to(() => AddTaskUi());
              addtaskSer.getTask();
            },
          )
        ],
      ),
    );
  }
}
