import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class RulesBlock extends StatelessWidget {
  const RulesBlock({
    Key? key,
    required String id,
    required String title,
    required String description,
  })  : _id = id,
        _title = title,
        _description = description,
        super(key: key);

  final String _id;
  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth! * 0.7,
      // height: screenHeight! * 0.07,
      // color: ReelfolioColor.buttonColor,
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
                  _id,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
                  _title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GT-America-Compressed-Regular",
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, top: 10),
                  child: Text(
                    _description,
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
