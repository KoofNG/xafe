import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:xafe/cores/constants/colors.dart';
import 'package:xafe/cores/constants/routes.dart';

import '../../../../../cores/constants/styles.dart';
import '../../../../../cores/widgets/xafe_appbar.dart';
import '../../../../../cores/widgets/xafe_base_widget.dart';
import '../../../../../cores/widgets/xafe_button.dart';
import '../../../../../cores/widgets/xafe_input.dart';
import '../viewmodel/signup_viewmodel.dart';
import '../widgets/build_form.dart';
import '../widgets/page_indicator.dart';

/// Sign up screen
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return XafeBaseWidget<SignupViewModel>(
      model: SignupViewModel(firebaseSignUpService: Provider.of(context)),
      onModelReady: (model) {
        model.getIndicatorWidth(context: context);
      },
      builder: (context, model, child) {
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
                              stage: model.stage,
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
                                controller: model.fullNameController,
                              ),
                            ),
                            BuildForm(
                              index: 1,
                              stage: model.stage,
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
                                controller: model.emailController,
                              ),
                            ),
                            BuildForm(
                              index: 2,
                              stage: model.stage,
                              title: 'Enter the code',
                              child: XafeInputField(
                                hintText:
                                    'Enter the code sent to your email address',
                                validator: (code) {
                                  if (code.isEmpty) return 'Code is required';
                                  return null;
                                },
                                inputType: TextInputType.number,
                                controller: model.codeController,
                              ),
                            ),
                            BuildForm(
                              index: 3,
                              stage: model.stage,
                              title: 'Add a password',
                              child: XafeInputField(
                                hintText: 'Enter password',
                                validator: (password) {
                                  if (password.isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (password.length < 8) {
                                    return 'Password must be up to 8 character';
                                  }
                                  return null;
                                },
                                inputType: TextInputType.text,
                                controller: model.passwordController,
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
                        width: model.getIndicatorWidth(context: context),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: XafeButton(
                          text: 'Next',
                          busy: model.appState,
                          onPressed: () async {
                            if (!_signUpformkey.currentState.validate()) return;
                            await model.submit(context: context);
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
      },
    );
  }
}
