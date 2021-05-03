import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../cores/services/firebase_firestore_service.dart';
import '../models/app_user.dart';

///
class FirebaseSignUpService {
  /// Firebase Auth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ///
  final XafeAppFirebaseFirestoreDb _xafeAppFirebaseFirestoreDb;

  ///
  FirebaseSignUpService({
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
}
