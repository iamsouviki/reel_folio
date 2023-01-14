import 'package:flutter/material.dart';

import '../../../util/colors.dart';
import '../../../util/size_config.dart';

class ActionButtonWidget extends StatelessWidget {

  final String buttonText;

  const ActionButtonWidget({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth! * 0.7,
      height: screenHeight! * 0.07,
      color: ReelfolioColor.buttonColor,
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth! * 18 / 375,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
