import 'package:cloud_firestore/cloud_firestore.dart';
import '../../app/authentication/sign_up/data/models/app_user.dart';

///
class XafeAppFirebaseFirestoreDb {
  ///
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///CREATE OPERATIONS
  Future<bool> createUser({AppUser user, String userId}) async {
    var isSuccessful = false;
    await firestore
        .collection('users')
        .doc(userId)
        .set(user.toFirebase())
        .whenComplete(() {
      isSuccessful = true;
    });
    return isSuccessful;
  }
}
