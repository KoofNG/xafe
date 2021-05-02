import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cores/constants/colors.dart';
import 'cores/constants/routes.dart';
import 'cores/routes/appRoutes.dart';
import 'cores/setups/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: cardColor,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        initialRoute: homeScreen,
      ),
    );
  }
}
