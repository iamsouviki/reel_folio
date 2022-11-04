import 'package:flutter/material.dart';
import 'package:reel_folio/settings/widgets/app_bar_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class SettingsTermsPage extends StatelessWidget {
  const SettingsTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SettingsAppBarWidget(title: "Terms of Service"),
                Divider(
                  color: Colors.white.withOpacity(0.6),
                  thickness: 1,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenWidth! * 63 / 375),
                child: Text(
                  "Terms of service are the legal agreements between a service provider and a person who wants to use that service. The person must agree to abide by the terms of service in order to use the offered service. Terms of service can also be merely a disclaimer, especially regarding the use of websites",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth! * 15 / 375,
                    fontWeight: FontWeight.w400,
                    height: 2,
                    // height: screenWidth! * 28 / 375,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
