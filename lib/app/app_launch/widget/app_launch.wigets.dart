import 'package:flutter/material.dart';
import '../../../cores/constants/routes.dart';
import '../../../cores/constants/styles.dart' show textStyle;

/// Returns Text widget for agreement
class BuildAgreemeentText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'By continuing, you agree to Xafe’s terms of use\nand privacy policy',
      style: textStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Returns Text widget for creating new account with gesture detector
class BuildCreateAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, signUpScreen),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'New here? ',
          style: textStyle.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Create an account',
              style: textStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
