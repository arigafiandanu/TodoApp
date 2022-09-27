import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetButton extends StatelessWidget {
  final Function() ontap;
  final String label;
  final Color color;

  const BottomSheetButton({
    super.key,
    required this.ontap,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: Get.width,
        height: Get.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: titleKegiatan,
        ),
      ),
    );
  }
}
