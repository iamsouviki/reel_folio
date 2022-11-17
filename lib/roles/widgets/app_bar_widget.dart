import 'package:flutter/material.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class RolesAppBar extends StatelessWidget {
  const RolesAppBar({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight! * 10 / 812,
        horizontal: screenWidth! * 0.03,
      ),
      child: Row(
        children: [
          Image.asset(ReelFolioIcon.iconArrowBackward),
          Spacer(
            flex: 3,
          ),
          Text(
            _title,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth! * 15 / 375,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
