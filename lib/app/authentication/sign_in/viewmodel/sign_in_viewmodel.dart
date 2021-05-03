import 'package:flutter/material.dart';
import '../../../../cores/setups/baseviewmodel.dart';

/// [SigninViewModel]
class SigninViewModel extends XafeBaseViewModel {
  bool _showPassword = true;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
}
