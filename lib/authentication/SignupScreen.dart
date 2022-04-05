// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  FirebaseAuth UserAuthentication = FirebaseAuth.instance;

  void SnackbarError() async{
    
  }

  void LogIn() async{
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

  String UserEmail = '';
  String UserPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.lightBlue,
      //   title: Title(color: Colors.white, child: Text("Login to Twitter",)),

      // ),

      body: Container(

        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 70),
        child: new Form(child: Column(
          children: [
            Image.asset('assets/twitter_icon.png'),
            Text('Log in to Twitter', style: TextStyle(fontSize: 30  ),),

            TextFormField(onChanged: (value) => setState(() {
              UserEmail = value;
            }), decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30))),
            ),
            
            TextFormField(onChanged: (value) => setState(() {
              UserEmail = value;
            }), decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30))),
            ),

            ElevatedButton(onPressed: () async => {LogIn()}, child: Text('Log In'))
          ],
        )),

      ),
    );
  }
}