import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class UserSocialMediaInformationScreen extends StatelessWidget {
  UserSocialMediaInformationScreen({Key? key}) : super(key: key);

  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 60,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(
          text: 'Where can we find\nyour worK?',
          textAlign: TextAlign.center,
        ),
        const AspectRatio(
          aspectRatio: 375 / 15,
          child: SizedBox(),
        ),
        const ScreenSubTitleWidget(
          text:
              'Share a link so the reelfolio team can review your work (i.e. YouTube, Vimeo, Instagram, LinkedIn, etc.)',
          textAlign: TextAlign.center,
        ),
        const AspectRatio(
          aspectRatio: 375 / 45,
          child: SizedBox(),
        ),
        TextField(
          controller: _urlController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          cursorColor: const Color(0xFF474747),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth! * 22 / 375,
          ),
          decoration: InputDecoration(
            hintText: '    www.vimeo.com/myvideo',
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
