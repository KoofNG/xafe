import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../cores/constants/routes.dart';
import '../../../../../cores/constants/styles.dart';
import '../../../../../cores/widgets/xafe_appbar.dart';
import '../../../../../cores/widgets/xafe_base_widget.dart';
import '../../../../../cores/widgets/xafe_button.dart';
import '../../../../../cores/widgets/xafe_header.dart';
import '../../../../../cores/widgets/xafe_input.dart';
import '../viewmodel/sign_in_viewmodel.dart';

/// [Signin] screen
class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> _signInformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return XafeBaseWidget<SigninViewModel>(
      model: SigninViewModel(firebaseSignInService: Provider.of(context)),
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XafeAppBar(),
                  SizedBox(height: 30.0),
                  XafeHeader(
                    title: 'Welcome back',
                    subTitle: 'Login to your account',
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _signInformkey,
                        child: Column(
                          children: [
                            XafeInputField(
                              hintText: 'email address',
                              isFilled: true,
                              controller: model.emailController,
                              validator: (email) {
                                if (email.isEmpty) return 'Email is required';
                                if (!RegExp(emailRegex).hasMatch(email)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              inputType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 10.0),
                            XafeInputField(
                              hintText: '●●●●●●●●●●●●',
                              controller: model.passwordController,
                              isFilled: true,
                              isPassword: model.showPassword,
                              suffixIcon: GestureDetector(
                                child: SvgPicture.asset(
                                  'lib/assets/svgs/eye.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                                onTap: () {
                                  model.changePasswordVisibility();
                                },
                              ),
                              validator: (password) {
                                if (password.isEmpty) {
                                  return 'Password is required';
                                }
                                if (password.length < 8) {
                                  return 'Password must be up to 8 characters';
                                }
                                return null;
                              },
                              inputType: TextInputType.text,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: XafeButton(
                      text: 'Login',
                      busy: model.appState,
                      onPressed: () {
                        if (!_signInformkey.currentState.validate()) return;
                        model.signIn(context: context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
