import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class OpenPositionRowWidget extends StatelessWidget {
  const OpenPositionRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "director",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: screenWidth! * 0.2,
        ),
        Container(
          height: 27,
          width: 23,
          decoration: BoxDecoration(
            color: ReelfolioColor.buttonColor.withOpacity(0.4),
          ),
          child: Center(
            child: Text("1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }
}
