import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../../project_page/widgets/filter_field_widget.dart';

Widget FilterModalProjects(BuildContext context) {
  return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 20 / 375, vertical: 10),
      height: screenHeight! * 610 / 812,
      color: filterbgcolor,
      child: Column(
        children: [
          ///Heading
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 30.0,
                  )),
              const Text(
                "FILTER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'GT-America-Compressed-Regular',
                    fontWeight: FontWeight.w400),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Clear",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.62),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! * 15 / 375,
                          vertical: screenHeight! * 5 / 812),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ))),
            ],
          ),

          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  filled: true,
                  hintText: " Search",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: searchTextcolor,
                  ),
                  prefixIcon: Visibility(
                    visible: true,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  fillColor: searchBarcolor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )),

              FilterField("Directoral",1),
              FilterField("Directoral",1),
              FilterField("Directoral",1),
              FilterField("Directoral",1),
              FilterField("Directoral",1),
        ],
      ));
}


