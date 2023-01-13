import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class LoginActionButton extends StatelessWidget {
  const LoginActionButton({
    Key? key,
    required String buttonText,
  })  : _buttonText = buttonText,
        super(key: key);

  final String _buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth! * 0.7,
      height: screenHeight! * 0.07,
      color: ReelfolioColor.buttonColor,
      child: Center(
        child: Text(
          _buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
