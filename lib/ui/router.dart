import 'package:demo_app/core/models/post.dart';
import 'package:demo_app/ui/views/home_view.dart';
import 'package:demo_app/ui/views/login_view.dart';
import 'package:demo_app/ui/views/post_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());

      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => LoginView());

      case PostView.routeName:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
