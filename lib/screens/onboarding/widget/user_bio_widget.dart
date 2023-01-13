import 'package:flutter/material.dart';
import 'package:reel_folio/screens/onboarding/widget/tools/screen_title_widget.dart';
import 'package:reel_folio/util/size_config.dart';

import 'tools/screen_sub_title_widget.dart';

class UserBioWidget extends StatelessWidget {
  UserBioWidget({Key? key}) : super(key: key);

  final _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 70,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'ADD YOUR BIO',textAlign: TextAlign.center,),
        const AspectRatio(
          aspectRatio: 375 / 15,
          child: SizedBox(),
        ),
        const ScreenSubTitleWidget(text: 'Show us Who you are',textAlign: TextAlign.center,),
        const AspectRatio(
          aspectRatio: 375 / 35,
          child: SizedBox(),
        ),
        TextField(
          controller: _bioController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: null,
          minLines: 12,
          cursorColor: Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 18 / 375,
          ),
          decoration: InputDecoration(
            hintMaxLines: 6,
            hintText:
                'Tell us about you. What are your movies? Are you repped? Here’s the spot to tell everyone! Make it a conversation starter.  ',
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: screenWidth! * 16 / 375,
            ),
            enabled: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF474747),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
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
