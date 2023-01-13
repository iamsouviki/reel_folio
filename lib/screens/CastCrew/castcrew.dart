import 'package:flutter/material.dart';
import 'package:reel_folio/screens/CastCrew/widget/Cast_crew_item_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/screens/widget/default_navbar.dart';
import 'package:reel_folio/screens/widget/slidder.dart';

class CastCrewScreen extends StatefulWidget {
  CastCrewScreen({Key? key}) : super(key: key);

  @override
  State<CastCrewScreen> createState() => _CastCrewScreenState();
}

class _CastCrewScreenState extends State<CastCrewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: secondarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 60 / 812),
            child: DefaultNavbar(context, "Cast & Crew")),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth! * 0.05, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical:20.0),
                child: Text(
                  "CREATOR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontFamily: ,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(child: _verticalList(4, context)),

              Padding(
                padding: EdgeInsets.only(bottom:20.0),
                child: Text(
                  "CREW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontFamily: ,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(child: _verticalList(3, context)),
            ],
          ),
        ),
      ),
    );
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => CastCrewItem()),
  );
}
