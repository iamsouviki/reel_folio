import 'package:flutter/material.dart';
import 'package:reel_folio/Home/widget/project_category_detail_navbar.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: primarybgcolor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 190 / 812),
            child: ProjectCategoryNavbar(context),
          ),
          body: SingleChildScrollView(
              child: Container(height: screenHeight! * 400 / 812,child: _gridList(2),)
          )),
        );
  }
}

ListView _gridList(int n) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => gridImage()),
  );
}

Widget gridImage(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: screenWidth!*0.05),
    height: screenHeight!*0.2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ReelfolioImageAsset.homePeopleImage2,),
            SizedBox(height: screenHeight!*0.01,),
            Text("Project Name",style: TextStyle(color: Colors.white,fontSize: 16),),
            Text("Project Owner",style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 14),)
          ],
        ),
      
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ReelfolioImageAsset.homePeopleImage2,),
            SizedBox(height: screenHeight!*0.01,),
            Text("Project Name",style: TextStyle(color: Colors.white,fontSize: 16),),
            Text("Project Owner",style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 14),)
          ],
        ),
    ],)
  );
}