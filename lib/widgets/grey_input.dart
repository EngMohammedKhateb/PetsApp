import 'package:flutter/material.dart';

import '../themes/theme_service.dart';

// ignore: non_constant_identifier_names
Widget GreyInput(
    {TextEditingController? controller,
    int minLine = 1,
    int maxLine = 1,
    Icon? icon,
    bool secure = false,
    String hint = ""}) {
  return TextField(
    cursorColor: Colors.black,
    controller: controller,
    minLines: minLine,
    maxLines: maxLine,
    obscureText: secure,
    style: TextStyle(
      color: !ThemeService().isDarkModeActive()
          ? Colors.grey[200]
          : const Color(0xFF252525),
    ),
    decoration: InputDecoration(
      filled: true,
      prefixIcon: icon,
      hintText: hint,
      fillColor: !ThemeService().isDarkModeActive()
          ? const Color(0xFF252525)
          : Colors.grey[200],
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5)),
    ),
  );
}
