import 'dart:async';

import 'package:demo_app/core/models/user.dart';
import 'package:demo_app/core/services/api.dart';
import 'package:demo_app/locator.dart';

class AuthenticationService {
  final _api = locator<Api>();
  StreamController<User> userStreamController = StreamController<User>();

  Future<bool> login(int userId) async {
    User user = await _api.getUserProfile(userId);
    var hasUser = user != null;
    if (hasUser) {
      userStreamController.add(user);
    }
    return hasUser;
  }
}
