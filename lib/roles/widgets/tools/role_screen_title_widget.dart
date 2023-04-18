import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class RoleScreenTitleWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const RoleScreenTitleWidget({Key? key, required this.text, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: screenWidth! * 18 / 375,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        fontFamily: 'GT-America-Extended-Bold',
        letterSpacing: -0.1,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
