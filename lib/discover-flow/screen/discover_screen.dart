import 'package:flutter/material.dart';
import 'package:reel_folio/discover-flow/screen/people_screen.dart';
import 'package:reel_folio/discover-flow/services/discover_service.dart';
import 'package:reel_folio/discover-flow/widget/people.dart';
import 'package:reel_folio/discover-flow/widget/projects.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/screens/widget/bottom_navbar.dart';

import '../widget/navbar.dart';

var id=0;

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 190 / 812),
            child: HomeNavbar(context,_tabController),
          ),
          backgroundColor: primarybgcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: screenHeight!,
                    width: screenWidth,
                    color: primarybgcolor,
                    child: DefaultTabController(
                      length: 2,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(child: HomeProjects(context)),
                          const PeopleScreen(),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 55,
            child: BottomNavBar(context),) ,
        ));
  }
}


