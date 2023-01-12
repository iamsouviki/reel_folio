import 'package:get_it/get_it.dart';
import 'package:reel_folio/login_data.dart';

import 'user_preferences.dart';

void setupServiceLocator(){
  GetIt.I.registerLazySingleton<UserPreferences>(() => UserPreferences());
  GetIt.I.registerLazySingleton<LoginData>(() => LoginData());
}