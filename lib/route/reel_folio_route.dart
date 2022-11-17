import 'package:flutter/material.dart';
import 'package:reel_folio/Chat/chat_screen.dart';
import 'package:reel_folio/Chat/chatmain.dart';
import 'package:reel_folio/Home/homepage.dart';
import 'package:reel_folio/auth/splash_screen.dart';
import 'package:reel_folio/onboarding/onboardng_request_confirmation_screen.dart';
import 'package:reel_folio/onboarding/welcome_screen.dart';
import 'package:reel_folio/portfolio/portfolio_home.dart';
import 'package:reel_folio/route/route_path.dart';
import '../onboarding/onboarding_details_screen.dart';
import '../onboarding/onboarding_request_screen.dart';

abstract class ReelFolioRoute {
  static String? currentRouteName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRouteName = settings.name;
    Widget currentWidget;

    switch (settings.name) {
      case RoutePath.routeInitial:
      case RoutePath.routeToSplashScreen:
        currentWidget = const SplashScreen();
        break;
      case RoutePath.routeToRequestOnBoardingScreen:
        currentWidget = OnBoardingRequestScreen();
        break;

      case RoutePath.routeToOnBoardingDetailsScreen:
        currentWidget = OnBoardingDetailsScreen();
        break;

      case RoutePath.routeToOnBoardingConfirmationScreen:
        currentWidget = const OnBoardingRequestConfirmationScreen();
        break;

      case RoutePath.routeToWelcomeScreen:
        currentWidget = const WelcomeScreen();
        break;

      case RoutePath.routeToHomeScreen:
        currentWidget = const Homepage();
        break;

      case RoutePath.routeToChatScreen:
        currentWidget = ChatMain();
        break;

      case RoutePath.routeToPortfolioScreen:
        currentWidget = const PortfolioHomePage();
        break;

      // case RoutePath.routeToProjectCategoryDetails:
      //   _currentWidget = Detail();
      //   break;

      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }

    return _ReelFolioRoute(screen: currentWidget, settings: settings);
  }
}

class _ReelFolioRoute extends PageRouteBuilder {
  final Widget screen;
  final RouteSettings settings;

  _ReelFolioRoute({required this.screen, required this.settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              screen,
          settings: settings,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
