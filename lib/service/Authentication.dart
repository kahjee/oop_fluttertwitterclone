import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitterclone/models/TwitterUser.dart';
import 'package:twitterclone/models/UserInfo.dart';

  void SnackbarError() async{
    SnackBar(content: const Text("Invalid input"));
  }

class Authentication {
  FirebaseAuth authmechanism = FirebaseAuth.instance;

  Stream<UserInfoModel?> get TwitterUser{
    return authmechanism.authStateChanges().map(_FirebaseUser);
  }

  TwitterUserModel? _FirebaseUser(User TwitterUser){
    return TwitterUser != null ? TwitterUserModel(id: TwitterUser.uid) : null;
  }


  void SignUp(UserEmail, UserPassword) async{
    try {
  User TwitterUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: UserEmail,
    password: UserPassword
  )) as User;

  _FirebaseUser(TwitterUser);
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    SnackbarError();
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    SnackbarError();
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }

  
  Future LogIn(UserEmail, UserPassword) async{
    try {
  User TwitterUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "admin@admin.com",
    password: "admin1"
  )) as User;

  _FirebaseUser(TwitterUser);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    SnackbarError();
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    SnackbarError();
    print('Wrong password provided for that user.');
  }
}
  }

}