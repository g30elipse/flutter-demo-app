import 'package:demo_app/core/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:demo_app/core/models/user.dart';
import 'package:demo_app/ui/router.dart';
import 'package:demo_app/ui/views/login_view.dart';
import 'package:demo_app/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (_) =>
          locator<AuthenticationService>().userStreamController.stream,
      builder: (__, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginView.routeName,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
