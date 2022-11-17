import 'package:flutter/material.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class EditDetailsTextPage extends StatefulWidget {
  const EditDetailsTextPage({super.key});

  @override
  State<EditDetailsTextPage> createState() => _EditDetailsTextPageState();
}

class _EditDetailsTextPageState extends State<EditDetailsTextPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ReelfolioColor.bgColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.05,
                  vertical: screenHeight! * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(ReelFolioIcon.iconArrowBackward)),
                  Text(
                    "Edit Portfolio",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.white.withOpacity(0.3),
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.6),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.05,
                  vertical: screenHeight! * 0.02),
              child: Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth! * 0.05,
                // vertical: screenHeight! * 0.02
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  filled: true,
                  // fillColor: Colors.white.withOpacity(0.3),
                  // TODO Text colour white

                  hintText: "Will Erwin",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.6),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth! * 0.05,
                  vertical: screenHeight! * 0.02),
              child: Row(
                children: [
                  Text(
                    "Bio",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth! * 0.05,
                // vertical: screenHeight! * 0.02
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  filled: true,
                  // fillColor: Colors.white.withOpacity(0.3),
                  // TODO Text colour white

                  hintText:
                      "Tell us about you. What are your four favorite movies? Are you repped? Here’s the spot to tell everyone! Start a conv",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
