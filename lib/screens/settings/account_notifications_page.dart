import 'package:flutter/material.dart';
import 'package:reel_folio/screens/settings/widgets/account_appbar_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class SettingsAccountPage extends StatelessWidget {
  const SettingsAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Name';
    const value = 'Will Erwin';
    const valueColor = Colors.white;
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.shadowColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountPageAppBarWidget(title: "Account and Notifications"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountDetailsWidget(
                    title: title,
                    value: value,
                    valueColor: valueColor,
                    spaceBetween: screenWidth! * 0.17,
                  ),
                  AccountDetailsWidget(
                    title: "Username",
                    value: "@werwin",
                    spaceBetween: screenWidth! * 0.09,
                    valueColor: Colors.white.withOpacity(0.4),
                  ),
                  AccountDetailsWidget(
                    title: "Password",
                    value: "********",
                    spaceBetween: screenWidth! * 0.09,
                    valueColor: Colors.white.withOpacity(0.4),
                  ),
                  AccountDetailsWidget(
                    title: "Email",
                    value: "werwin15@gmail.com",
                    spaceBetween: screenWidth! * 0.17,
                    valueColor: Colors.white,
                  ),
                  AccountDetailsWidget(
                    title: "Phone",
                    value: "248-931-9089",
                    spaceBetween: screenWidth! * 0.15,
                    valueColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 0.05,
                        vertical: screenWidth! * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Change your Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth! * 15 / 375,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth! * 0.05,
                              bottom: screenWidth! * 0.02),
                          child: Text(
                            "Old Password",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: screenWidth! * 15 / 375,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            // hintText: 'Enter a search term',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth! * 0.05,
                              bottom: screenWidth! * 0.02),
                          child: Text(
                            "New Password",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: screenWidth! * 15 / 375,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            // hintText: 'Enter a search term',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth! * 0.01),
                          child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ReelfolioColor.confirmButtonColor),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth! * 0.05),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth! * 14 / 375,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.4),
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 0.05,
                        vertical: screenWidth! * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth! * 0.03),
                          child: Text(
                            "Change your phone number",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth! * 15 / 375,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            // hintText: 'Enter a search term',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth! * 0.01),
                          child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ReelfolioColor.confirmButtonColor),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth! * 0.05),
                                child: Text(
                                  "Send Code",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth! * 14 / 375,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.4),
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

class AccountDetailsWidget extends StatelessWidget {
  const AccountDetailsWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.valueColor,
    required this.spaceBetween,
  }) : super(key: key);

  final String title;
  final String value;
  final Color valueColor;
  final double spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.05),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: screenWidth! * 15 / 375,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: spaceBetween,
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: valueColor,
                    fontSize: screenWidth! * 14 / 375,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
              thickness: 1,
              indent: screenWidth! * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
