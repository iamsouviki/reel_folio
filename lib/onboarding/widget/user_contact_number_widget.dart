import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';

class UserContactNumberWidget extends StatelessWidget {
  const UserContactNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ScreenTitleWidget(text: 'PHONE'),
        Text(
          'Create a username. You will be unable to change this. Choose wisely',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        TextField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          cursorColor: Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            hintText: 'first last',
            hintStyle: TextStyle(
              color: Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:  Color(0xFF474747),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
