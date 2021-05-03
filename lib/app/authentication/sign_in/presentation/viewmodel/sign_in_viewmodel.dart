import 'package:flutter/material.dart';

import '../../../../../cores/constants/colors.dart';
import '../../../../../cores/constants/routes.dart';
import '../../../../../cores/constants/styles.dart';
import '../../../../../cores/setups/baseviewmodel.dart';
import '../../data/datasources/sign_in_service.dart';
import '../../data/models/login_user.dart';

/// [SigninViewModel]
class SigninViewModel extends XafeBaseViewModel {
  bool _showPassword = true;

  ///
  final FirebaseSignInService _firebaseSignInService;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  ///
  SigninViewModel({
    @required FirebaseSignInService firebaseSignInService,
  }) : _firebaseSignInService = firebaseSignInService;

  ///
  TextEditingController get emailController => _emailController;

  ///
  TextEditingController get passwordController => _passwordController;

  ///
  bool get showPassword => _showPassword;

  ///
  void changePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  ///
  void signIn({BuildContext context}) async {
    setState(state: true);

    var loginUser = LoginUser(
      email: _emailController.value.text,
      password: _passwordController.value.text,
    );

    var signInResult = await _firebaseSignInService.login(loginUser: loginUser);

    if (signInResult) {
      Navigator.pushNamed(context, dashboardScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Something went wrong',
            style: textStyle.copyWith(
              color: cardColor,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.red[400],
        ),
      );
    }

    setState(state: false);
  }
}
