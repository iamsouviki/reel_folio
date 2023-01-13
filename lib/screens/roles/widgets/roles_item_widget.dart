import 'package:flutter/material.dart';
import 'package:reel_folio/screens/login/login_page.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class RolesItemWidget extends StatelessWidget {
  const RolesItemWidget({
    Key? key,
    required this.body,
    // required this.route,
  }) : super(key: key);

  final String body;
  // final route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => route),
            // );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                body,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth! * 17 / 375,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(ReelFolioIcon.iconSmallArrowForward),
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.6),
        ),
      ],
    );
  }
}
