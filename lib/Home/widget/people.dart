import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget HomePeople() {
  return Container(
    height: screenHeight! * 400 / 812,
    child: _verticalList(8),
  );
}

ListView _verticalList(int n) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => PeopleListItem()),
  );
}

Widget PeopleListItem() {
  return Container(
      // height: screenHeight!*0.2,
      child: Stack(
    // alignment: Alignment.center,
    children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: Image.asset(
              ReelfolioImageAsset.homePeopleImage1,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          )),
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight! * 0.03, left: screenWidth! * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LINDSAY\nSUNADA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 43,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: screenHeight! * 10 / 812),
            Text(
              "PRODUCTION\nDESIGNER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(top: screenHeight! * 150 / 812, right:screenWidth! * 0.1),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(68, 26)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(width: 1.5, color: Colors.white),
                ),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "View",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ))

      // Image.asset(ReelfolioImageAsset.homePeopleImage1, fit: BoxFit.cover,),
    ],
  ));
}


