import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/Home/homepage.dart';
import 'package:reel_folio/auth/splash_screen.dart';
import 'package:reel_folio/route/reel_folio_route.dart';

import 'package:reel_folio/route/test_route.dart';
import 'package:reel_folio/service_locator.dart';
import 'util/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();;

  setupServiceLocator();

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
            return const MaterialApp(
              title: 'Reel Folio',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: ReelFolioRoute.generateRoute,
              //home: SplashScreen(),
              // onGenerateRoute: ReelFolioRoute.generateRoute,
              // Temporary re-route for testing.
              //home: TestRoutePage(),
            );
          },
        );
      },
    );
  }
}
