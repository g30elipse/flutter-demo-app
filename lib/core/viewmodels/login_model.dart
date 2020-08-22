import 'package:demo_app/core/enums/viewstate.dart';
import 'package:demo_app/core/services/authentication_service.dart';
import 'package:demo_app/core/viewmodels/base_mode.dart';
import 'package:demo_app/locator.dart';

class LoginModel extends BaseModel {
  final _authenticationService = locator<AuthenticationService>();
  String errorMsg;

  Future<bool> login(String userIdText) async {
    errorMsg = '';
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMsg = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
