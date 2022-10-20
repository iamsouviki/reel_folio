import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

Widget HomeNavbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text('DISCOVER',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
        )),
    centerTitle: false,
    backgroundColor: primarybgcolor,
    flexibleSpace: NavbarUtil(),
    elevation: 0,
  );
}

Widget NavbarUtil() {
  
  
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              child: SizedBox(
                height: screenHeight! * 40 / 812,
                width: 200,
                child: const DefaultTabController(
                  length: 2,
                  child: TabBar(
                    // controller: tabController,
                    indicatorColor: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        Tab(
                          child: Text(
                            'Projects',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'People',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Container(
                padding:
                    EdgeInsets.symmetric(vertical: screenHeight! * 10 / 812),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(120, 20)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Filter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ))
          ],
        ))
  ]);
}
