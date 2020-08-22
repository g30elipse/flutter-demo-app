import 'package:demo_app/core/services/api.dart';
import 'package:demo_app/core/services/authentication_service.dart';
import 'package:demo_app/core/viewmodels/comments_model.dart';
import 'package:demo_app/core/viewmodels/home_model.dart';
import 'package:demo_app/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
}
