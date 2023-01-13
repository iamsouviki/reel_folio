import 'package:flutter/material.dart';
import 'package:reel_folio/screens/Contacts/add_contacts.dart';
import 'package:reel_folio/screens/Contacts/widget/contacts_item.dart';
import 'package:reel_folio/screens/Contacts/widget/contacts_navbar.dart';
import 'package:reel_folio/util/asset.dart';
// import 'package:reel_folio/onboarding/manager/role_selection_manager.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/screens/widget/slidder.dart';

class ContactsMain extends StatefulWidget {
  const ContactsMain({Key? key}) : super(key: key);

  @override
  State<ContactsMain> createState() => _ContactsMainState();
}

class _ContactsMainState extends State<ContactsMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: secondarybgcolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 80 / 812),
            child: ContactsNavbar(context)),
        // body: Column(
        //     children: [
             body: SizedBox(
              height: screenHeight,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight!*0.2,
                    child: _verticalList(3, context)),
                  SizedBox(height: screenHeight!*0.1,),
                  Image.asset(ReelfolioImageAsset.addContacts),
                  SizedBox(height: screenHeight!*0.06,),
                  ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddContacts()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tagcolor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "Add from Address Book",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
                ],
              )),
             ),
          //   ],
          // ),
        );
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => SliderListItem(context, ContactsItem())),
  );
}