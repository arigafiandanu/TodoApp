import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerService extends GetxController {
  var selectdate = DateTime.now().obs;

  var selectTimeNow = DateFormat("hh:mm a").format(DateTime.now()).toString();
  var selectTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  // void dapatTanggal() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: selectdate,
  //     firstDate: DateTime(2021),
  //     lastDate: DateTime(2040),
  //   );
  // }
}
