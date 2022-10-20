import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget ProjectCategoryNavbar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text('DISCOVER',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
        )),
    centerTitle: false,
    backgroundColor: primarybgcolor,
    flexibleSpace: NavbarUtilProject(context),
    elevation: 0,
  );
}

Widget NavbarUtilProject(BuildContext context) {
  return Column(children: [
    SizedBox(height: screenHeight! * 60 / 812),
    Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth! * 10 / 375),
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
    Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth! * 10 / 375),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(children: [
                Text(
                  'CREWING UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
            ),
              ],
            ),

            
            Stack(
              children: [
                Divider(
                  color: secondaryTextColor2,
                  thickness: 1,
                  height: 0,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                  height: 0,
                  indent: screenWidth! * 40 / 375,
                  endIndent: screenWidth! * 210 / 375,
                ),
              ],
            )
          ],
        ))
  ]);
}
