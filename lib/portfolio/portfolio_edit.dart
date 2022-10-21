import 'package:flutter/material.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class PortfolioEditPage extends StatefulWidget {
  const PortfolioEditPage({super.key});

  @override
  State<PortfolioEditPage> createState() => _PortfolioEditPageState();
}

class _PortfolioEditPageState extends State<PortfolioEditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Image.asset(ReelFolioIcon.iconArrowBackward),
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
        ],
      ),
    ));
  }
}
