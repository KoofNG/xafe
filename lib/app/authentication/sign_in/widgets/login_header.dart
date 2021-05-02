import 'package:flutter/widgets.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/styles.dart';

/// [Login] header widget
class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: textStyle.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: titleColor,
            ),
          ),
          SizedBox(height: 2.0),
          Text(
            'Login to your account',
            style: textStyle.copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: subColor,
            ),
          )
        ],
      ),
    );
  }
}
