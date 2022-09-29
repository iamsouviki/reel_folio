import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        ScreenTitleWidget(text: 'YOUR NAME'),
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
        ScreenTitleWidget(text: 'YOUR EMAIL'),
        TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            hintText: 'email@reelfolio.com',
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
