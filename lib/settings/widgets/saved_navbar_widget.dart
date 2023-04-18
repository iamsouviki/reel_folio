import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget SavedNavbar(BuildContext context) {
  return Container(
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth! * 0.05),
      child: Column(children: [
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15,
                )),

            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Saved",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),

            // IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white, size: 25,)),
          ],
        ),
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: screenHeight! * 0.055),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                  thickness: 1,
                  // height: screenHeight!*0.13,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: screenWidth! * 0.7,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        tabs: [
                          Tab(
                            child: Text(
                              "All",
                              // style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "People",
                              // style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Projects",
                              // style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        )
      ]));
}
