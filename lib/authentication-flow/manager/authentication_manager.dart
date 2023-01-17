import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/authentication-flow/model/otp_model.dart';

import '../services/auth_service.dart';

final authProvider = Provider<AuthService>(
  (ref) => AuthService(),
);

final otpManager =
    FutureProvider.autoDispose<OTPResponse?>(
  (ref) => ref.read(authProvider).sendOTP(),
);
