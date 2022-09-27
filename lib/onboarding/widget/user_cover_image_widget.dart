import 'dart:io';

import 'package:flutter/material.dart';

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
        Text(
          'UPLOAD A COVER PHOTO',
          style: TextStyle(
            fontSize: screenWidth! * 30 / 375,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'GT-America',
            letterSpacing: -0.1,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidth! * 10 / 375,
        ),
        const Text(
          'Show the world your work',
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
