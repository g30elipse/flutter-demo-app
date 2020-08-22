import 'package:demo_app/core/enums/viewstate.dart';
import 'package:demo_app/ui/views/base_view.dart';
import 'package:demo_app/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:demo_app/core/viewmodels/login_model.dart';
import 'package:demo_app/locator.dart';
import 'package:demo_app/ui/shared/app_colors.dart';
import 'package:demo_app/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              controller: textEditingController,
              validationMessage: model.errorMsg,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess =
                          await model.login(textEditingController.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, HomeView.routeName);
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
