import 'package:flutter/material.dart';

import '../../../util/colors.dart';
import '../../../util/size_config.dart';

class RulesWidget extends StatelessWidget {

  final String id;
  final String title;
  final String description;

  const RulesWidget({Key? key, required this.id, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth! * 0.7,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: ReelfolioColor.circleColor,
            child: CircleAvatar(
              backgroundColor: ReelfolioColor.shadowColor,
              radius: 26,
              child: Center(
                child: Text(
                  id,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth! * 30 / 375,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 42, top: 28),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GT-America-Compressed-Regular",
                    fontSize: screenWidth! * 35 / 375,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 10),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
