import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../cores/constants/colors.dart';
import '../../../../../cores/constants/routes.dart';
import '../../../../../cores/constants/styles.dart';
import '../../../../../cores/setups/baseviewmodel.dart';
import '../../data/datasource/sign_up_service.dart';
import '../../data/models/app_user.dart';

///
class SignupViewModel extends XafeBaseViewModel {
  ///
  final FirebaseSignUpService _firebaseSignUpService;

  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _codeController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _loadData = false;

  ///
  SignupViewModel({@required FirebaseSignUpService firebaseSignUpService})
      : _firebaseSignUpService = firebaseSignUpService;

  ///
  TextEditingController get fullNameController => _fullNameController;

  ///
  TextEditingController get emailController => _emailController;

  ///
  TextEditingController get codeController => _codeController;

  ///
  TextEditingController get passwordController => _passwordController;

  int _stage = 0;

  ///
  int get stage => _stage;

  ///
  double getIndicatorWidth({BuildContext context}) {
    print(_stage);

    if (_stage == 0) {
      return MediaQuery.of(context).size.width * 0.25;
    } else if (_stage == 1) {
      return MediaQuery.of(context).size.width * 0.5;
    } else if (_stage == 2) {
      return MediaQuery.of(context).size.width * 0.75;
    } else {
      return MediaQuery.of(context).size.width * 1.0;
    }
  }

  ///
  void buildProgressIndicator() {
    print(_stage);
    switch (_stage) {
      case 0:
        if (_fullNameController.value.text.isNotEmpty) {
          _stage = _stage + 1;
          notifyListeners();
        }
        break;
      case 1:
        if (_emailController.value.text.isNotEmpty) {
          _stage = _stage + 1;
          notifyListeners();
        }
        break;
      case 2:
        if (_codeController.value.text.isNotEmpty) {
          _stage = _stage + 1;
          notifyListeners();
        }
        break;
      case 3:
        if (_passwordController.value.text.isNotEmpty) {
          _stage = _stage;
          _loadData = true;
          notifyListeners();
        }
        break;
      default:
        _stage = 1;
        notifyListeners();
    }
  }

  ///
  Future<void> submit({
    AppUser appUser,
    String password,
    BuildContext context,
  }) async {
    var _isSuccessful = false;
    buildProgressIndicator();
    if (_loadData) {
      setState(state: true);
      appUser = AppUser(
        fullName: _fullNameController.value.text,
        email: _emailController.value.text,
        code: _codeController.value.text,
      );
      var signUpResult = await _firebaseSignUpService.signUp(
        appUser: appUser,
        password: _passwordController.value.text,
      );

      if (signUpResult) {
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
    return _isSuccessful;
  }
}
