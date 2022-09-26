import 'package:agenda_hari_ini/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormW extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const TextFormW({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: Get.height * 0.05,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.green[50],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    readOnly: widget == null ? false : true,
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[800],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
