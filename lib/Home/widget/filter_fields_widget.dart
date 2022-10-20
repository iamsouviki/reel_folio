import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget FilterField(String text, id) {
  return id == 1
      ? Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )),
            ]),
            const Divider(height: 10, color: secondaryTextColor2, thickness: 1),
          ],
        )
      : Container(
        height: screenHeight! * 50 / 812,
          child: _filtertags(1),
        );
}

// List<String> filtertags = ["Union", "Non-Union", "SAG-AFTRA", "Non-SAG-AFTRA","Series","Feature","Short","Commercial","Music Video","Other"];
// var count=0;
ListView _filtertags(int n) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => FilterTags()),
  );
}

Widget FilterTags() {
  // print(count);
  return Container(
    // width: screenWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      OutlinedButton(
          onPressed: () {},
          child: Text(
            "Series",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white, width: 1),
              minimumSize: Size(screenWidth! * 0.42, 40),
              // backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 15 / 375,
                  vertical: screenHeight! * 5 / 812),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ))),
      OutlinedButton(
          onPressed: () {},
          child: Text(
            "Series",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white, width: 1),
              minimumSize: Size(screenWidth! * 0.42, 40),
              // backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 15 / 375,
                  vertical: screenHeight! * 5 / 812),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ))),
    ]),
  );
}
