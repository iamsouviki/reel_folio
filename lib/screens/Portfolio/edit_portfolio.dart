import 'package:flutter/material.dart';
import 'package:reel_folio/util/size_config.dart';

class EditPortfolioPicture extends StatefulWidget {
  EditPortfolioPicture({Key? key}) : super(key: key);

  @override
  State<EditPortfolioPicture> createState() => _EditPortfolioPictureState();
}

class _EditPortfolioPictureState extends State<EditPortfolioPicture> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:true,
      child: Scaffold(
        // appBar: ,
        body: Column(children: [
          Text("Change your portfolio picture.",style: TextStyle(fontSize: 25),),
          Text("Show us who you are!", style: TextStyle(fontSize: 15),),
          SizedBox(height: 20,),
          // Image.asset("assets/images/"),

          OutlinedButton(
          onPressed: () {},
          child: Text(
            "+ Add a picture",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white, width: 1),
              minimumSize: Size(screenWidth! * 0.42, 40),
              // backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 15 / 375,
                  vertical: screenHeight! * 5 / 812),
              )),
        ]),
      ),
    );
  }
}
