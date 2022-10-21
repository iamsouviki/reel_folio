import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/portfolio/portfolio_edit.dart';
import 'package:reel_folio/portfolio/portfolio_edit_profile_picture.dart';
import 'package:reel_folio/portfolio/portfolio_home.dart';
import 'package:reel_folio/portfolio/portfolio_my.dart';
import 'package:reel_folio/portfolio/test.dart';
import 'package:reel_folio/route/reel_folio_route.dart';

import 'util/size_config.dart';

void main() {
  runApp(const ProviderScope(child: ReelFolioApp()));
}

class ReelFolioApp extends StatelessWidget {
  const ReelFolioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Reel Folio',
              //theme: ThemeData(fontFamily: 'Sora'),
              debugShowCheckedModeBanner: false,
              // onGenerateRoute: ReelFolioRoute.generateRoute,
              // Temporary re-route for testing.
              home: PortfolioEditPage(),
            );
          },
        );
      },
    );
  }
}
