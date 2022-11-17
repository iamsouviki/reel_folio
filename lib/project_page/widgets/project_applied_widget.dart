import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class AppliedWidget extends StatelessWidget {
  const AppliedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start Date",
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              "10.05.2020",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(
          width: screenWidth! * 0.25,
        ),
        Container(
          height: screenWidth! * 0.18,
          width: screenWidth! * 0.5,
          decoration: BoxDecoration(
            color: ReelfolioColor.buttonColor.withOpacity(0.4),
          ),
          child: const Center(
            child: Text(
              "Applied",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
