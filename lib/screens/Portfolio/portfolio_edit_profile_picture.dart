import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../authentication-flow/screens/onboarding/widget/tools/add_profile_asset_widget.dart';
import '../../authentication-flow/screens/onboarding/widget/tools/screen_sub_title_widget.dart';
import '../../authentication-flow/screens/onboarding/widget/tools/screen_title_widget.dart';

// class EditDetailsProfilePicturePage extends StatefulWidget {
//   EditDetailsProfilePicturePage({super.key});

//   final ValueNotifier<File?> _imageNotifier = ValueNotifier<File?>(null);

//   @override
//   State<EditDetailsProfilePicturePage> createState() =>
//       _EditDetailsProfilePicturePageState();
// }

// class _EditDetailsProfilePicturePageState
//     extends State<EditDetailsProfilePicturePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       child: Scaffold(
//         backgroundColor: ReelfolioColor.bgColor,
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth! * 0.05,
//                   vertical: screenHeight! * 0.02),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset(ReelFolioIcon.iconArrowBackward),
//                   Text(
//                     "Edit Portfolio",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     color: Colors.white.withOpacity(0.3),
//                     child: Text(
//                       "Update",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               color: Colors.white.withOpacity(0.6),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: screenHeight! * 0.05),
//               child: Column(
//                 children: [
//                   Text(
//                     "Change your portfolio picture.",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 25,
//                       fontFamily: "GT-America-Compressed-Regular",
//                     ),
//                   ),
//                   Text(
//                     "Show us who you are!",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                       fontFamily: "GT-America-Compressed-Regular",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ValueListenableBuilder(
//               valueListenable: _imageNotifier,
//               builder: (BuildContext context, File? value, Widget? child) {
//                 return Container(
//                   height: screenWidth! * 128 / 375,
//                   width: screenWidth! * 128 / 375,
//                   decoration: value != null
//                       ? BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             image: FileImage(value),
//                             fit: BoxFit.cover,
//                           ),
//                         )
//                       : BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.white),
//                         ),
//                 );
//               },
//             ),
//             const AspectRatio(
//               aspectRatio: 375 / 70,
//               child: SizedBox(),
//             ),
//             AddProfileAssetWidget(
//               onUploadImage: (file) {
//                 _imageNotifier.value = file;
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class EditDetailsProfilePicturePage extends StatelessWidget {
  EditDetailsProfilePicturePage({Key? key}) : super(key: key);

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
        const ScreenTitleWidget(
          text: 'ADD A PORTFOLIO\nPICTURE',
          textAlign: TextAlign.center,
        ),
        const AspectRatio(
          aspectRatio: 375 / 10,
          child: SizedBox(),
        ),
        const ScreenSubTitleWidget(
          text: 'Show us who you are',
          textAlign: TextAlign.center,
        ),
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
          },
        ),
      ],
    );
  }
}
