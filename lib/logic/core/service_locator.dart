import 'package:get_it/get_it.dart';
import '../../user_preferences.dart';
import '../services/auth_service.dart';
import 'login_data.dart';

void setupServiceLocator(){
  GetIt.I.registerLazySingleton<UserPreferences>(() => UserPreferences());
  GetIt.I.registerLazySingleton<LoginData>(() => LoginData());
  GetIt.I.registerLazySingleton<AuthService>(() => AuthService());
}