import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class ScreenSubTitleWidget extends StatelessWidget {

  final String text;

  const ScreenSubTitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: screenWidth! * 14 / 375,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      maxLines: 3,
    );
  }
}
