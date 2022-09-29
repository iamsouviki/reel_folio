import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/add_profile_asset_widget.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';
import 'package:reel_folio/util/size_config.dart';

class UserProfilePictureWidget extends StatelessWidget {
  UserProfilePictureWidget({Key? key}) : super(key: key);

  final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ScreenTitleWidget(text: 'ADD A PORTFOLIO\nPICTURE'),

        SizedBox(
          height: screenWidth! * 10 / 375,
        ),
        const Text(
          'Show us who you are',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: screenWidth! * 20 / 375,
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
                  : const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
            );
          },
        ),
        SizedBox(
          height: screenWidth! * 40 / 375,
        ),
        AddProfileAssetWidget(
          onUploadImage: (file) {
            _imageNotifier.value = file;
          },
        ),
      ],
    );
  }
}
