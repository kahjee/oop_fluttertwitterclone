import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitterclone/models/TwitterUser.dart';

// This code would allow the user to log into the Twitter clone, if they have created an account using an email.

  void SnackbarError() async{
    const SnackBar(content: Text("Invalid input"));
  }

class Authentication {
  FirebaseAuth authmechanism = FirebaseAuth.instance;

  String UserEmail = '';
  String UserPassword = '';

  TwitterUserModel? _FirebaseUser(User? TwitterUser) {
    // ignore: unnecessary_null_comparison
    return user != null? TwitterUserModel(id: TwitterUser!.uid) : null;
  }

  Stream<TwitterUserModel?> get user {
    return authmechanism.authStateChanges().map(_FirebaseUser);
  }

  Future SignUp(UserEmail, UserPassword) async{
    try {
  User TwitterUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: UserEmail,
    password: UserPassword
  )) as User;

   _FirebaseUser(TwitterUser);
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    SnackbarError();
    debugPrint('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    SnackbarError();
    debugPrint('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }

  
  Future LogIn(UserEmail, UserPassword) async{
    try {
  User TwitterUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: UserEmail,
    password: UserPassword
  )) as User;

  _FirebaseUser(TwitterUser);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    SnackbarError();
    debugPrint('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    SnackbarError();
    debugPrint('Wrong password provided for that user.');
  }
}
  }


Future SignOut() async{
  try{
    return await authmechanism.signOut();
  }
  catch(e){
    debugPrint(e.toString());
    return null;
  }
}

}