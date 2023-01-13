import 'package:flutter/material.dart';
import 'package:reel_folio/util/reel_folio_icon.dart';
import 'package:reel_folio/util/size_config.dart';

// Widget PortfolioNavbar()  {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     foregroundColor: Colors.transparent,
//     shadowColor: Colors.transparent,
//     leading: Image.asset(ReelFolioIcon.iconArrowBackward),
//     elevation: 0,
//   );
// }

// Appbar not working.

class PortfolioAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  PortfolioAppBar({super.key})
      : preferredSize = Size.fromHeight(screenHeight! * 0.05);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text(
      //     title,
      //     style: TextStyle(color: Colors.black),
      // ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      leading: Image.asset(ReelFolioIcon.iconArrowBackward),
      // automaticallyImplyLeading: true,
    );
  }
}