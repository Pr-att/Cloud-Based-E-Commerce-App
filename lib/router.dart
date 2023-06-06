import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (context) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Error 404'),
          ),
        ),
      );
  }
}
