import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';

class UserBioWidget extends StatelessWidget {
  const UserBioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ScreenTitleWidget(text: 'ADD YOUR BIO'),
        Text(
          'Show us Who you are',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: null,
          minLines: 12,
          cursorColor: Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintMaxLines: 6,
            hintText:
                'Tell us about you. What are your movies? Are you repped? Here’s the spot to tell everyone! Make it a conversation starter.  ',
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
            focusedBorder: OutlineInputBorder(
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
