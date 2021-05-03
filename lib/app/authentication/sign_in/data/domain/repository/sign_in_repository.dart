import 'package:firebase_auth/firebase_auth.dart';
import '../../datasources/sign_in_service.dart';
import '../../models/login_user.dart';

///
class SignInRepository {
  ///
  final FirebaseSignInService firebaseSigninService = FirebaseSignInService();

  ///
  Future signIn({LoginUser loginUser}) async {
    try {
      await firebaseSigninService.login(
        loginUser: loginUser,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
