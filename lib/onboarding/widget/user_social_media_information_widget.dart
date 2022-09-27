import 'package:flutter/material.dart';

class UserSocialMediaInformationWidget extends StatelessWidget {
  const UserSocialMediaInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Where can we find\nyour worK?',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'GT-America',
            letterSpacing: -0.1,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Share a link so the reelfolio team can review your work (i.e. YouTube, Vimeo, Instagram, LinkedIn, etc.)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
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
