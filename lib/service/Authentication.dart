import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitterclone/models/TwitterUser.dart';
import 'package:twitterclone/models/UserInfo.dart';

  void SnackbarError() async{
    SnackBar(content: const Text("Invalid input"));
  }

class Authentication {
  FirebaseAuth authmechanism = FirebaseAuth.instance;

  String UserEmail = '';
  String UserPassword = '';

  TwitterUserModel? _FirebaseUser(User TwitterUser) {
    return user != null? TwitterUserModel(id: TwitterUser.uid) : null;
  }

  Stream<TwitterUserModel> get user {
    return authmechanism.authStateChanges().map(_FirebaseUserEdit(_FirebaseUser.toString()));
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
    email: UserEmail,
    password: UserPassword
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


Future SignOut() async{
  try{
    return await authmechanism.signOut();
  }
  catch(e){
    print(e.toString());
    return null;
  }
}

  TwitterUserModel Function(User? event) _FirebaseUserEdit(String string) {}
}