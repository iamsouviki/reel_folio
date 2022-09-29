import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding/widget/screen_sub_title_widget.dart';
import 'package:reel_folio/onboarding/widget/screen_title_widget.dart';

import '../../util/size_config.dart';
import 'add_profile_asset_widget.dart';


class UserCoverImageWidget extends StatelessWidget {
  UserCoverImageWidget({Key? key}) : super(key: key);

  final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AspectRatio(
          aspectRatio: 375 / 70,
          child: SizedBox(),
        ),
        const ScreenTitleWidget(text: 'UPLOAD A COVER PHOTO',textAlign: TextAlign.center,),
        const AspectRatio(
          aspectRatio: 375 / 10,
          child: SizedBox(),
        ),
        const ScreenSubTitleWidget(text: 'Show the world your work', textAlign: TextAlign.center,),
        const AspectRatio(
          aspectRatio: 375 / 40,
          child: SizedBox(),
        ),
        ValueListenableBuilder(
          valueListenable: _imageNotifier,
          builder: (BuildContext context, File? value, Widget? child) {
            return Container(
              height: screenWidth! * 130 / 375,
              width: screenWidth!,
              decoration: value != null
                  ? BoxDecoration(
                image: DecorationImage(
                  image: FileImage(value),
                  fit: BoxFit.cover,
                ),
              )
                  : const BoxDecoration(
                color: Colors.red,
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
          },
        ),
      ],
    );
  }
}
