import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../cores/constants/colors.dart';
import '../../../cores/constants/styles.dart';
import '../../../cores/widgets/xafe_button.dart';
import '../widget/app_launch.wigets.dart';

/// App Home Screen
class AppHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: titleColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'xafe',
                      style: textStyle,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Smart Budgeting',
                      style: textStyle.copyWith(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    XafeButton(
                      text: 'Login',
                      // onPressed: () => Navigator.pushNamed(context, routeName) ,
                    ),
                    SizedBox(height: 20.0),
                    buildCreateAccountText(),
                    SizedBox(height: 40.0),
                    buildAgreemeentText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
