import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/widget/default_navbar.dart';

class ApplyMessage extends StatefulWidget {
  const ApplyMessage({super.key});

  @override
  State<ApplyMessage> createState() => _ApplyMessageState();
}

class _ApplyMessageState extends State<ApplyMessage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: secondarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 60 / 812),
            child: DefaultNavbar(context, "Apply")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight!*0.06,),
              const Text(
                "ADD A SHORT MESSAGE?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  // fontFamily: "GT-America-Compressed-Regular",
                ),
                textAlign: TextAlign.center,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.2),
                child: const Text(
                  "write a few sentences on why you’re right for the job",
                  style: TextStyle(
                    color: searchTextcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    // fontFamily: "GT-America-Compressed-Regular",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // SizedBox(height: screenHeight! * 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40.0),
                child: TextFormField(
                  minLines:8,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(30.0),
                    hintText: 'Stand out: write a couple sentences on why your right for the job! ',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryTextColor2,width: 1),
                    ),
                    // border: 
                    
                  ),
                ),
              ),
              SizedBox(height: screenHeight! * 0.1),
              Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth! * 0.1, vertical: screenHeight! * 0.05),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth! * 0.8, 50),
                backgroundColor: navbarIconcolor,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(32.0),
                // ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ApplyMessage()));
              },
              // color: Colors.blue,
              // textColor: Colors.white,
              child: const Text('Message'),
            ),
          ),
              
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth! * 0.1,0, screenWidth! * 0.1, screenHeight! * 0.05),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth! * 0.1, 50),
                backgroundColor: navbarIconcolor,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(32.0),
                // ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ApplyMessage()));
              },
              // color: Colors.blue,
              // textColor: Colors.white,
              child: const Text('Submit'),
            ),
          ),
      ),
    );
  }
}
