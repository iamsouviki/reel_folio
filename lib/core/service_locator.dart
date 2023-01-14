import 'package:get_it/get_it.dart';
import '../authentication-flow/services/auth_service.dart';
import '../user_preferences.dart';
import '../authentication-flow/services/login_data.dart';

void setupServiceLocator(){
  GetIt.I.registerLazySingleton<UserPreferences>(() => UserPreferences());
  GetIt.I.registerLazySingleton<LoginData>(() => LoginData());
  GetIt.I.registerLazySingleton<AuthService>(() => AuthService());
}