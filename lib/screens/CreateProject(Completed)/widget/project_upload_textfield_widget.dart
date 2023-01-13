import 'package:flutter/material.dart';

Widget ProjectUploadDetails(String hintText) {
  return TextField(
    maxLines: 4,
    minLines: 1,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),

      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.3),
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}
