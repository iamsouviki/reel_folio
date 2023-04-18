import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class SettingsRowWidget extends StatelessWidget {
  const SettingsRowWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.08, vertical: screenWidth! * 0.05),
      child: Row(
        children: [
          Image.asset(icon),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth! * 15 / 375,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
