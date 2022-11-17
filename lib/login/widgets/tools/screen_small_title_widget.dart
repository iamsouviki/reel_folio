import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class SmallTitleWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const SmallTitleWidget({Key? key, required this.text, this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: screenWidth! * 24 / 375,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        fontFamily: "GT-America-Compressed-Regular",
      ),
      maxLines: 3,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
