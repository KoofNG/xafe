import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cores/constants/colors.dart';
import 'cores/constants/routes.dart';
import 'cores/routes/appRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  // Enforce portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(XafeApp());
    },
  );
}

/// This is the entrance of the Xafe Mobile App
class XafeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: cardColor,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: homeScreen,
    );
  }
}
