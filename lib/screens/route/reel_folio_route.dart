import 'package:flutter/material.dart';
import 'package:reel_folio/authentication-flow/screens/authentication_screen.dart';
import 'package:reel_folio/authentication-flow/screens/forget_password_screen.dart';
import 'package:reel_folio/authentication-flow/screens/login_email_screen.dart';
import 'package:reel_folio/authentication-flow/screens/login_password_screen.dart';
import 'package:reel_folio/authentication-flow/screens/registration_rules_screen.dart';
import 'package:reel_folio/authentication-flow/screens/reset_password_screen.dart';
import 'package:reel_folio/discover-flow/screen/discover_screen.dart';
import 'package:reel_folio/screens/Portfolio/portfolio_home.dart';
import 'package:reel_folio/screens/route/route_path.dart';
import '../../authentication-flow/screens/onboarding_details_screen.dart';
import '../../authentication-flow/screens/onboarding_request_screen.dart';
import '../../authentication-flow/screens/onboardng_request_confirmation_screen.dart';
import '../../authentication-flow/screens/welcome_screen.dart';
import '../Chat/chatmain.dart';
import '../CreateProject(Completed)/new _project.dart';
import '../auth/splash_screen.dart';

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
      case RoutePath.routeToAuthenticationScreen:
        currentWidget = const AuthenticationScreen();
        break;
      case RoutePath.routeToLoginScreen:
        currentWidget = const LoginEmailScreen();
        break;
      case RoutePath.routeToPasswordOTPScreen:
        currentWidget = const LoginPasswordScreen();
        break;
      case RoutePath.routeToForgetPasswordScreen:
        currentWidget = const ForgetPasswordScreen();
        break;
      case RoutePath.routeToResetPasswordScreen:
        currentWidget = const ResetPasswordScreen();
        break;
      case RoutePath.routeToRegistrationRulesScreen:
        currentWidget = const RegistrationRulesScreen();
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
        currentWidget = const DiscoverScreen();
        break;

      case RoutePath.routeToChatScreen:
        currentWidget = ChatMain();
        break;

      case RoutePath.routeToPortfolioScreen:
        currentWidget = const PortfolioHomePage();
        break;

      case RoutePath.routeToCreateProject:
        currentWidget = NewProjectWidget();
        break;

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

            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
