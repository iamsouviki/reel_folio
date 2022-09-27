import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class UserProfilePictureWidget extends StatelessWidget {
  const UserProfilePictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ADD A PORTFOLIO\nPICTURE',
          style: TextStyle(
            fontSize: screenWidth! * 30 / 375,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'GT-America',
            letterSpacing: -0.1,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 10 / 375,
        ),
        const Text(
          'Show us who you are',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: screenWidth! * 20 / 375,
        ),
        Container(
          height: screenWidth! * 128 / 375,
          width: screenWidth! * 128 / 375,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: screenWidth! * 40 / 375,
        ),
        Container(
          height: screenWidth! * 65 / 375,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.4),
          ),
          child: Center(
            child: Text(
              '+ Add from camera roll',
              style: TextStyle(
                  fontSize: screenWidth! * 16 / 375,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
