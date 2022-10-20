import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';

Widget FilterField(String text) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(text,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400)),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            )),
            
      ]),
      const Divider(height: 10, color: secondaryTextColor2, thickness: 1),
    ],
  );
}