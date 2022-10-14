import 'package:flutter/material.dart';

import '../util/size_config.dart';
import 'widget/tools/screen_title_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth! * 70 / 375,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AspectRatio(
                  aspectRatio: 373 / 250,
                  child: SizedBox(),
                ),
                const ScreenTitleWidget(text: 'WELCOME'),
                const AspectRatio(
                  aspectRatio: 373 / 20,
                  child: SizedBox(),
                ),
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: screenWidth! * 18 / 375,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  maxLines: 6,
                  textAlign: TextAlign.center,
                ),
                const AspectRatio(
                  aspectRatio: 373 / 40,
                  child: SizedBox(),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: screenWidth! * 18 / 375,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  maxLines: 6,
                  textAlign: TextAlign.center,
                ),
                const AspectRatio(
                  aspectRatio: 373 / 50,
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth! * 12 / 375,
                      vertical: screenWidth! * 8 / 375),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth! * 10 / 375),
                    ),
                  ),
                  child: Text(
                    'BUILD YOUR PORTFOLIO',
                    style: TextStyle(
                      fontSize: screenWidth! * 28 / 375,
                      color: Colors.white,
                      fontFamily: 'GT-America-Compressed-Regular',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const AspectRatio(
                  aspectRatio: 373 / 35,
                  child: SizedBox(),
                ),
                Text(
                  "I'LL DO IT LATER",
                  style: TextStyle(
                    fontSize: screenWidth! * 20 / 375,
                    color: const Color(0xFF767676),
                    fontFamily: 'GT-America-Compressed-Regular',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String text1 =
    'You’re almost ready to start showcasing your work and making connections!';

String text2 =
    'Upload and share your reel to  get discovered and begin collaborating with others.';
