import 'package:flutter/material.dart';
import 'package:reel_folio/Home/widget/navbar.dart';
import 'package:reel_folio/Home/widget/people.dart';
import 'package:reel_folio/Home/widget/projects.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/widget/bottom_navbar.dart';
var id=0;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
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
                          Container(child: HomePeople()),
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


