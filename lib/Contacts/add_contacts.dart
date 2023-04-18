import 'package:flutter/material.dart';
import 'package:reel_folio/Contacts/widget/contacts_navbar.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class AddContacts extends StatefulWidget {
  AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: secondarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 80 / 812),
            child: ContactsNavbar(context)),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 20 / 375),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight!*0.06,),
              Text(
                "ON REELFOLIO",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                    // fontFamily: "GT-America-Compressed-Regular"),
              ),),
              SizedBox(height:30),
              Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(ReelfolioImageAsset.chatProfilePic),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // SizedBox(height:10),
                        Text(
                          "Cole Jones",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text("@singlethought",
                            style: TextStyle(color: tagcolor1, fontSize: 15)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      decoration: const BoxDecoration(
                        color: tagcolor1,
                        // borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
                  SizedBox(height: screenHeight!*0.02,),
                  const Divider(
                    color: filterbgcolor,
                    thickness: 1,
                  ),
                  SizedBox(height: screenHeight!*0.05,),
                ],
              ),


              Text(
                "INVITE FROM CONTACTS",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    // fontFamily: "GT-America-Compressed-Regular"),
              ),),
              const SizedBox(height:30),
              Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(ReelfolioImageAsset.chatProfilePic),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // SizedBox(height:10),
                        Text(
                          "Another Person",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text("87582354889",
                            style: TextStyle(color: secondaryTextColor2, fontSize: 15)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.fromBorderSide(BorderSide(color: Colors.white.withOpacity(0.5))),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Invite",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
                  SizedBox(height: screenHeight!*0.05,),
                  const Divider(
                    color: filterbgcolor,
                    thickness: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
