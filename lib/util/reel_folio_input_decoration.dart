import 'package:flutter/material.dart';

InputDecoration textInputDecoration({
  required BuildContext context,
  required String hintText,
}) {
  var width = MediaQuery.of(context).size.width;
  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(width * 14 / 375),
    borderSide: const BorderSide(width: 1.2, color: Colors.white),
  );
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    isDense: true,
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white, fontSize: width * 14 / 375),
    counterText: '',
    focusedBorder: border,
    enabledBorder: border,
    border: border,
  );
}