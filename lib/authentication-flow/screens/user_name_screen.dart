import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({Key? key}) : super(key: key);

  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 150,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'USERNAME'),
        SizedBox(
          height: screenWidth! * 22 / 375,
        ),
        const ScreenSubTitleWidget(
          text:
              'Create a username. You will be unable to change this. Choose wisely',
        ),
        SizedBox(
          height: screenWidth! * 21 / 375,
        ),
        TextField(
          controller: _userNameController,
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
