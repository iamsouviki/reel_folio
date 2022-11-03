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
            body: Container(
              height: screenHeight! * 752 / 812,
              child: Column(children: [
                Container(
                  height: 100,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 10 / 375),
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
                    )),
                _verticalList(2, context),
              ]),
            )));
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => NotiItem()),
  );
}
