import 'package:flutter/material.dart';
import '../../util/size_config.dart';
import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class UserContactNumberScreen extends StatelessWidget {

  UserContactNumberScreen({Key? key}) : super(key: key);

  final _contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 150,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'PHONE'),
        SizedBox(
          height: screenWidth! * 22 / 375,
        ),
        const ScreenSubTitleWidget(
          text:
              'Please list your cell phone number. It will only be used for authentication purposes.',
        ),
        SizedBox(
          height: screenWidth! * 21 / 375,
        ),
        TextField(
          controller: _contactNumberController,
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
