import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../app/authentication/sign_in/data/datasources/sign_in_service.dart';
import '../../app/authentication/sign_up/data/datasource/sign_up_service.dart';
import '../services/firebase_firestore_service.dart';

/// All App providers are listed here
List<SingleChildWidget> providers = <SingleChildWidget>[
  Provider.value(value: XafeAppFirebaseFirestoreDb()),
  Provider.value(value: FirebaseSignInService()),
  Provider.value(value: FirebaseSignInService()),
  ProxyProvider<XafeAppFirebaseFirestoreDb, FirebaseSignUpService>(
    update: (context, value, previous) {
      return FirebaseSignUpService(xafeAppFirebaseFirestoreDb: value);
    },
  ),
];
