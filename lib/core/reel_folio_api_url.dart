abstract class ReelFolioAPIURL {
  static const String baseURL = 'https://reelfolioapi.qworkz.co.uk/v1.0';

  static const String oAuthURL = '$baseURL/oauth/token';

  static const String loginURL = '$baseURL/login';

  static const String otpURL = '$baseURL/send-otp';

  static const String loginWithOTPURL = '$baseURL/login-with-otp';

  static const String onBoardingStepOne = '$baseURL/onboarding-step-one';

  static const String onBoardingStepTwo = '$baseURL/onboarding-step-two';

  static const String onBoardingFinalStep =
      '$baseURL/onboarding-final-step-after-approve';

  static const String userRole = '$baseURL/get-skills';

  static const String userPortfolio = '$baseURL/my-portfolio';

  static const String reelFolioUserList = '$baseURL/people';

  static const String reelFolioUserPortfolio = '$baseURL/people-portfolio/';
}
