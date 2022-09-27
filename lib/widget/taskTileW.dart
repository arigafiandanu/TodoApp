import 'package:agenda_hari_ini/model/taskModel.dart';
import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTileW extends StatelessWidget {
  final TaskModel taskModel;
  //  TaskTileW({super.key, this.taskModel});
  TaskTileW(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getbgColor(taskModel.color ?? 0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title ?? "",
                    style: titleKegiatan,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${taskModel.startTime} - ${taskModel.endTime}",
                        style: timeStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    taskModel.note ?? "",
                    style: noteStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted == 1 ? "COMPLETED" : "TODO",
                style: rotatedSyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  _getbgColor(int no) {
    switch (no) {
      case 0:
        return blueClr;
      case 1:
        return amberClr;
      case 2:
        return RedClr;
      default:
        return blueClr;
    }
  }
}
