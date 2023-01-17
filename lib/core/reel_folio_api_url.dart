abstract class ReelFolioAPIURL {
  static const String baseURL = 'https://api_reelfolio.qworkz.co.uk/v1.0';

  static const String oAuthURL = '$baseURL/oauth/token';

  static const String loginURL = '$baseURL/login';

  static const String otpURL = '$baseURL/send-otp';
}