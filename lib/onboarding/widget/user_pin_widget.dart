import 'package:flutter/material.dart';

import '../../util/size_config.dart';
import 'screen_sub_title_widget.dart';
import 'screen_title_widget.dart';

class UserPinWidget extends StatelessWidget {
  UserPinWidget({Key? key}) : super(key: key);

  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 110,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'ENTER PIN'),
        SizedBox(
          height: screenWidth! * 10 / 375,
        ),
        const ScreenSubTitleWidget(
          text:
          'Type the four-digit code that you received via text.',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 60 / 375,
        ),
        TextField(
          controller: _pinController,
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
      ],
    );
  }
}
