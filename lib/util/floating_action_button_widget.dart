import 'package:flutter/material.dart';

import 'reel_folio_icon.dart';
import 'size_config.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Function onTap;

  const FloatingActionButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: screenWidth! * 50 / 375,
        width: screenWidth! * 58 / 375,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Center(
          child: ImageIcon(
            color: Colors.white,
            size: screenWidth! * 30 / 375,
            const AssetImage(
              ReelFolioIcon.iconArrowForward,
            ),
          ),
        ),
      ),
    );
  }
}
