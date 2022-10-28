import 'package:flutter/material.dart';
import 'package:reel_folio/Saved/widget/saved_list_widget.dart';
import 'package:reel_folio/Saved/widget/saved_navbar_widget.dart';
import 'package:reel_folio/util/colors.dart';
import 'package:reel_folio/util/size_config.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: primarybgcolor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight! * 150 / 812),
              child: SavedNavbar(context)),
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight,
              child: _verticalList(3, context)),
          )),
    );
  }
}

ListView _verticalList(int n, BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(n, (i) => SavedList(context)),
  );
}
