import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

import '../CreateProject(Completed)/widget/appbar_widget.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: ReelfolioColor.shadowColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(screenHeight! * 70 / 812),
                child: CreateProjectNavbar(
                    context, "ADD NEW PROJECT", SelectCategoryScreen())),
            body: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: screenHeight! * 0.05,
                ),
                Center(
                  child: const Text(
                    "SELECT A CATEGORY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: "GT-America-Compressed-Regular",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.2),
                  child: Text(
                    "select as many as your project represents\n(i.e., Narrative Horror)",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      // fontFamily: "GT-America-Compressed-Regular",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MANDATORY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          // fontFamily: "GT-America-Compressed-Regular",
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(screenWidth! * 0.4, screenWidth! * 0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(width: 3, color: Colors.black),
                        ),
                        backgroundColor: ReelfolioColor.shadowColor,
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        ' Union ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth! * 0.03,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(screenWidth! * 0.4, screenWidth! * 0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(width: 3, color: Colors.black),
                        ),
                        backgroundColor: ReelfolioColor.shadowColor,
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        ' Non-Union ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: screenHeight! * 0.05,
                // ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth! * 10 / 375, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        filled: true,
                        hintText: " Search",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        prefixIcon: Visibility(
                          visible: true,
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: Visibility(
                          visible: true,
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                        ),
                        fillColor: Colors.white.withOpacity(0.4),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )),
                Divider(
                  color: Colors.white.withOpacity(0.3),
                  thickness: 1,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth! * 10 / 375, vertical: 10),
                        height: screenHeight! * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Horror",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.add_box_sharp,
                                  color: Colors.white.withOpacity(0.3),
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.2),
                              thickness: 1,
                            )
                          ],
                        ));
                  },
                )
              ],
            ))));
  }
}
