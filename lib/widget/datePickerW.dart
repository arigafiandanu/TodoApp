import 'package:agenda_hari_ini/services/datepicker_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerW extends StatefulWidget {
  const DatePickerW({super.key});

  @override
  State<DatePickerW> createState() => _DatePickerWState();
}

class _DatePickerWState extends State<DatePickerW> {
  final dateService = Get.put(DatePickerService());
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.edit_calendar_rounded,
        color: Colors.grey,
      ),
      onPressed: () {
        dateService.getdatepicker();
      },
    );
  }

  // _getdatepicker() async {
  //   var getdata = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2018),
  //     lastDate: DateTime(2040),
  //   );
  //   if (getdata != null) {
  //     dateService.selectdate.value = getdata;
  //   } else {
  //     print("batal");
  //   }
  // }
}
