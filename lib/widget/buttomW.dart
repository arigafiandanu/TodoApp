import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tombol extends StatelessWidget {
  final Function() ontap;
  final String label;
  const Tombol({
    super.key,
    required this.label,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: Get.width * 0.35,
        height: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryClr,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
