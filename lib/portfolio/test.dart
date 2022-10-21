import 'package:flutter/material.dart';
import 'package:reel_folio/portfolio/widget/popup.dart';
import 'package:reel_folio/util/asset.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReelfolioColor.bgColor,
      body: Center(
        child: OutlinedButton(
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return PopUp(context);
              }),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white, width: 1),
            minimumSize: Size(screenWidth! * 0.2, 30),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth! * 0.04,
            ),
          ),
          child: const Text(
            "Edit Portfolio",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
