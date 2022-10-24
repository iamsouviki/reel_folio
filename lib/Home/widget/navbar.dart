import 'package:flutter/material.dart';
import 'package:reel_folio/Home/widget/filter_modal_people_widget.dart';
import 'package:reel_folio/Home/widget/filter_modal_projects_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';



Widget HomeNavbar(BuildContext context, TabController _tabController) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text('DISCOVER',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          fontFamily: 'GT-America-Compressed-Regular',
        )),
    centerTitle: false,
    backgroundColor: primarybgcolor,
    flexibleSpace: NavbarUtil(context, _tabController),
    elevation: 0,
  );
}

Widget NavbarUtil (BuildContext context,TabController _tabController) {
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
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    controller: _tabController,
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
                  onPressed: () {
                    
                    showModalBottomSheet(
                      isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          
                          return FilterModalProjects(context);
                        });
                  },
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


