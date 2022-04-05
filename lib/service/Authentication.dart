

import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth authmechanism = FirebaseAuth.instance;

  void LogIn(username, password) async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "admin@admin.com",
    password: "admin1"
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }

}