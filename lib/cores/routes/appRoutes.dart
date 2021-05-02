import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/app_home_screen.dart';
import '../constants/routes.dart';

/// App Generating routes
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return _buildPageRoute(page: AppHomeScreen());
      break;

    default:
      return _errorRoute();
  }
}

Route<dynamic> _buildPageRoute({Widget page}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (builder) => page);
  } else {
    return MaterialPageRoute(builder: (builder) => page);
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
