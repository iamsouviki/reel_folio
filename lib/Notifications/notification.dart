import 'package:flutter/material.dart';
import 'package:reel_folio/Notifications/widget/noti_item_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';
import 'package:reel_folio/widget/default_navbar.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: secondarybgcolor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(screenHeight! * 60 / 812),
                child: DefaultNavbar(context, "Notifications")),
            body: new SingleChildScrollView(
        child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
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
                      ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight!*0.05, horizontal: screenWidth!*0.04),
                  child: _verticalList(2, context),
                )
                
              ]),
            )));
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => NotiItem()),
  );
}
