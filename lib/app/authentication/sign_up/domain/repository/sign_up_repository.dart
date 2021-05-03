import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/datasource/sign_up_service.dart';
import '../../data/models/app_user.dart';

///
class SignUpRepository {
  ///
  final FirebaseSignUpService firebaseSignUpService = FirebaseSignUpService();

  ///
  Future createSignup({AppUser appUser, String password}) async {
    try {
      await firebaseSignUpService.signUp(appUser: appUser, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
