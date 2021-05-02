import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../cores/constants/styles.dart';
import '../../../../cores/widgets/xafe_appbar.dart';
import '../../../../cores/widgets/xafe_button.dart';
import '../../../../cores/widgets/xafe_input.dart';
import '../widgets/login_header.dart';

/// [Signin] screen
class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _signInformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XafeAppBar(),
              SizedBox(height: 30.0),
              LoginHeader(),
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
                          controller: _emailController,
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
                          controller: _passwordController,
                          isFilled: true,
                          isPassword: true,
                          suffixIcon: GestureDetector(
                            child: SvgPicture.asset(
                              'lib/assets/svgs/eye.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            onTap: () {},
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
                  onPressed: () {
                    if (_signInformkey.currentState.validate()) return;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
