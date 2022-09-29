import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/screen_sub_title_widget.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';

class UserSocialMediaInformationWidget extends StatelessWidget {
  const UserSocialMediaInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        ScreenTitleWidget(text: 'Where can we find\nyour worK?'),
        ScreenSubTitleWidget(text: 'Share a link so the reelfolio team can review your work (i.e. YouTube, Vimeo, Instagram, LinkedIn, etc.)'),
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
            hintText: '    www.vimeo.com/myvideo',
            hintStyle: TextStyle(
              color: Color(0xFF474747),
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
            focusedBorder: UnderlineInputBorder(
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
