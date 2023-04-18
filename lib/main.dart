//import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/authentication-flow/services/auth_service.dart';
import 'package:reel_folio/screens/route/reel_folio_route.dart';
import 'core/service_locator.dart';
import 'util/size_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();;

  setupServiceLocator();

  // final cron = Cron();
  // cron.schedule(Schedule.parse('*/10 * * * * '), () async {
  //   await AuthService().getClientSecret();
  //   print('Runs every 10 minutes');
  // });

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
