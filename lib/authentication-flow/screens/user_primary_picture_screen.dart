import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reel_folio/authentication-flow/screens/user_details_screen.dart';
import 'package:reel_folio/util/size_config.dart';

import 'widget/add_profile_asset_widget.dart';
import 'widget/screen_sub_title_widget.dart';
import 'widget/screen_title_widget.dart';

class UserProfilePictureWidget extends StatelessWidget {
  UserProfilePictureWidget({Key? key}) : super(key: key);

  final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);

  OnBoardingUserDetailsModel get _userDetails => GetIt.I<OnBoardingUserDetailsModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        const AspectRatio(
          aspectRatio: 375 / 70,
          child: SizedBox(),
        ),

        const ScreenTitleWidget(text: 'ADD A PORTFOLIO\nPICTURE',textAlign: TextAlign.center,),

        const AspectRatio(
          aspectRatio: 375 / 10,
          child: SizedBox(),
        ),
        const ScreenSubTitleWidget(text: 'Show us who you are',textAlign: TextAlign.center,),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        ValueListenableBuilder(
          valueListenable: _imageNotifier,
          builder: (BuildContext context, File? value, Widget? child) {
            return Container(
              height: screenWidth! * 128 / 375,
              width: screenWidth! * 128 / 375,
              decoration: value != null
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(value),
                        fit: BoxFit.cover,
                      ),
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                    ),
            );
          },
        ),
        const AspectRatio(
          aspectRatio: 375 / 70,
          child: SizedBox(),
        ),
        AddProfileAssetWidget(
          onUploadImage: (file) {
            _imageNotifier.value = file;
            _userDetails.profileImage = file;
          },
        ),
      ],
    );
  }
}
