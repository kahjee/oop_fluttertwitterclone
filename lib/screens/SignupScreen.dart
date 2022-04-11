// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/service/Authentication.dart';

// The SignupScreen is the screen where users log their email and passwords in or register if they do not have an account yet.

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  FirebaseAuth UserAuthentication = FirebaseAuth.instance;

  final Authentication _authServ = Authentication();

  String UserEmail = '';
  String UserPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        child: Form(child: Column(
          children: [
            Text('See what\'s happening in the world right now.', style: TextStyle(fontSize: 30, )),
            Image.asset('assets/twitter_icon.png'),
            Text('Log in to Twitter', style: TextStyle(fontSize: 30  ),),

            TextFormField(onChanged: (value) => setState(() {
              UserEmail = value;
            }), decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30))),
            ),

            SizedBox(height:30),
            
            TextFormField(onChanged: (value) => setState(() {
              UserPassword = value;
            }), obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30))),
            ),

            SizedBox(height:30),

            ElevatedButton(onPressed: () async => {_authServ.SignUp(UserEmail, UserPassword)}, child: Text('Sign Up')),

            SizedBox(height:5),

            ElevatedButton(onPressed: () async => {_authServ.LogIn(UserEmail, UserPassword)}, child: Text('Log In')),
          ],
        )),

      ),
    );
  }
}