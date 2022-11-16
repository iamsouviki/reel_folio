import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';

// ignore: non_constant_identifier_names
Widget CreateProjectNavbar(BuildContext context, String title, route) {
  return AppBar(
      backgroundColor: secondarybgcolor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: "GT-America-Compressed-Regular",
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0,top: 10,bottom:10),
          child: TextButton(
            child: Text('Next',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400)),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => route,
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: secondaryTextColor2,
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: Divider(
          color: filterbgcolor,
          thickness: 0.5,
        ),
      ));
}
