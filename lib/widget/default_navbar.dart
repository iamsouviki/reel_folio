import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';

// ignore: non_constant_identifier_names
Widget DefaultNavbar(BuildContext context, String title){
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
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            // actions: [
            //   TextButton(
            //     style: ButtonStyle(
            //       foregroundColor:
            //           MaterialStateProperty.all<Color>(secondaryTextColor),
            //     ),
            //     onPressed: () {},
            //     child: const Text('Chat'),
            //   ),
            // ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Divider(
                color: filterbgcolor,
                thickness: 0.5,
              ),
            ));
}