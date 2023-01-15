import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

import 'tools/screen_title_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  UserDetailsWidget({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 90,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'YOUR NAME'),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        TextField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'first last',
            hintStyle: TextStyle(
              color: const Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 22 / 375,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
          ),
        ),
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'YOUR EMAIL'),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        TextField(
          controller: _emailIDController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: 'email@reelfolio.com',
            hintStyle: TextStyle(
              color: const Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 22 / 375,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
