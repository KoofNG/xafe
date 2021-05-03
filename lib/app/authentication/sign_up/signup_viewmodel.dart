import 'package:flutter/widgets.dart';
import '../../../cores/setups/baseviewmodel.dart';

///
class SignupViewModel extends XafeBaseViewModel {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _codeController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
  void submit() {
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
          _stage = _stage + 1;
          notifyListeners();
        }
        break;
      default:
    }
  }
}
