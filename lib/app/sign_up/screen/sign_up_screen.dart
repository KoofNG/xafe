import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../cores/constants/styles.dart';
import '../../../cores/widgets/xafe_appbar.dart';
import '../../../cores/widgets/xafe_button.dart';
import '../../../cores/widgets/xafe_input.dart';
import '../widgets/build_form.dart';
import '../widgets/page_indicator.dart';

/// Sign up screen
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpformkey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _codeController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  int _stage = 0;

  double getIndicatorWidth() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              XafeAppBar(
                title: 'Sign up',
              ),
              SizedBox(height: 30.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _signUpformkey,
                    child: Column(
                      children: [
                        BuildForm(
                          index: 0,
                          stage: _stage,
                          title: 'What’s your name?',
                          child: XafeInputField(
                            hintText: 'Enter your first name and last name',
                            validator: (value) {
                              if (value.split(' ').length != 2) {
                                return 'Full name is required';
                              }
                              if (value.isEmpty) {
                                return 'Provide your full name';
                              }
                              return null;
                            },
                            inputType: TextInputType.text,
                            controller: _fullNameController,
                          ),
                        ),
                        BuildForm(
                          index: 1,
                          stage: _stage,
                          title: 'What’s your email?',
                          child: XafeInputField(
                            hintText: 'Enter your email address',
                            validator: (email) {
                              if (email.isEmpty) return 'Email is required';
                              if (!RegExp(emailRegex).hasMatch(email)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                        ),
                        BuildForm(
                          index: 2,
                          stage: _stage,
                          title: 'Enter the code',
                          child: XafeInputField(
                            hintText:
                                'Enter the code sent to your email address',
                            validator: (code) {
                              if (code.isEmpty) return 'Code is required';
                              return null;
                            },
                            inputType: TextInputType.number,
                            controller: _codeController,
                          ),
                        ),
                        BuildForm(
                          index: 3,
                          stage: _stage,
                          title: 'Add a password',
                          child: XafeInputField(
                            hintText: 'Enter password',
                            validator: (password) {
                              if (password.isEmpty) {
                                return 'Password is required';
                              }
                              if (password.length < 8) {
                                return 'Password must be up to 8 characters';
                              }
                              return null;
                            },
                            inputType: TextInputType.number,
                            controller: _passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageIndicator(
                    width: getIndicatorWidth(),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: XafeButton(
                      text: 'Next',
                      onPressed: () {
                        if (!_signUpformkey.currentState.validate()) return;

                        switch (_stage) {
                          case 0:
                            if (_fullNameController.value.text.isNotEmpty) {
                              setState(() {
                                _stage = _stage + 1;
                              });
                            }
                            break;
                          case 1:
                            if (_emailController.value.text.isNotEmpty) {
                              setState(() {
                                _stage = _stage + 1;
                              });
                            }
                            break;
                          case 2:
                            if (_codeController.value.text.isNotEmpty) {
                              setState(() {
                                _stage = _stage + 1;
                              });
                            }
                            break;
                          case 3:
                            if (_passwordController.value.text.isNotEmpty) {
                              setState(() {
                                _stage = _stage + 1;
                              });
                            }
                            break;
                          default:
                            setState(() {
                              _stage = _stage;
                            });
                            return;
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
