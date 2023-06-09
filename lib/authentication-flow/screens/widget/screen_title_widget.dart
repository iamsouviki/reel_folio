import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class ScreenTitleWidget extends StatelessWidget {

  final String text;
  final TextAlign? textAlign;

  const ScreenTitleWidget({Key? key, required this.text, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: screenWidth! * 35 / 375,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontFamily: 'GT-America-Compressed-Regular',
        letterSpacing: -0.1,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
