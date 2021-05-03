import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../cores/services/firebase_firestore_service.dart';
import '../../../sign_up/data/models/app_user.dart';
import '../models/login_user.dart';

///
class FirebaseSignInService {
  /// Firebase Auth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ///
  final XafeAppFirebaseFirestoreDb _xafeAppFirebaseFirestoreDb;

  ///
  FirebaseSignInService({
    XafeAppFirebaseFirestoreDb xafeAppFirebaseFirestoreDb,
  }) : _xafeAppFirebaseFirestoreDb = xafeAppFirebaseFirestoreDb;

  ///
  Future<bool> signUp({AppUser appUser, String password}) async {
    var _signUpSuccessful = false;

    var res = await firebaseAuth.createUserWithEmailAndPassword(
      email: appUser.email,
      password: password,
    );

    var ress = await _xafeAppFirebaseFirestoreDb.createUser(
      user: appUser,
      userId: firebaseAuth.currentUser?.uid,
    );

    if (res != null && ress == true) {
      _signUpSuccessful = true;
    }
    return _signUpSuccessful;
  }

  ///
  Future<bool> login({LoginUser loginUser}) async {
    var _signUpSuccessful = false;

    var res = await firebaseAuth.signInWithEmailAndPassword(
      email: loginUser.email,
      password: loginUser.password,
    );

    if (res != null) {
      _signUpSuccessful = true;
    }
    return _signUpSuccessful;
  }
}
