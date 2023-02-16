import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';
import 'package:reel_folio/authentication-flow/model/reel_folio_user_model.dart';
import 'package:reel_folio/authentication-flow/model/user_role_model.dart';

import '../services/auth_service.dart';

final authProvider = Provider<AuthService>(
  (ref) => AuthService(),
);

final otpManager = FutureProvider.family.autoDispose<OTPResponse?,String>(
  (ref,req) => ref.read(authProvider).sendOTP(req),
);

final reelFolioUserPortfolioManager = FutureProvider.autoDispose<ReelFolioUserModel?>(
  (ref) => ref.read(authProvider).getReelFolioUserPortfolio(),
);
