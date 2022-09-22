import 'package:flutter/material.dart';
import 'package:reel_folio/onboarding-request/user_details_screen.dart';
import 'package:reel_folio/onboarding-request/widget/onboarding_stepper_widget.dart';

import 'util/size_config.dart';

void main() {
  runApp(const ReelFolioApp());
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
            return const MaterialApp(
              title: 'Reel Folio',
              //theme: ThemeData(fontFamily: 'Sora'),
              debugShowCheckedModeBanner: false,
              //onGenerateRoute: SpessleRoute.generateRoute,
              home: OnBoardingScreen(),
            );
          },
        );
      },
    );
  }
}
