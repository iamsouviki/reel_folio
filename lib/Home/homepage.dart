import 'package:flutter/material.dart';
import 'package:reel_folio/Home/widget/navbar.dart';
import 'package:reel_folio/Home/widget/people.dart';
import 'package:reel_folio/Home/widget/projects.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

// late TabController tabController;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    SafeArea(
        top: true,
        child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(screenHeight! * 190 / 812),
                  child: HomeNavbar(),
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
                            // controller: tabController,
                            children: [
                              Container(child: HomeProjects(context)),
                              Container(child: HomePeople()),
                            ],
                          ),
                        ))
                  ],
                ))));
  }
}
