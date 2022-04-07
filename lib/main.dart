import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/main/HomeScreen.dart';
import 'package:twitterclone/models/TwitterUser.dart';
import 'package:twitterclone/screens/SignupScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitterclone/screens/WrapperScreen.dart';
import 'package:twitterclone/service/Authentication.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Authentication auth = Authentication();

    return StreamProvider<TwitterUserModel?>.value(
      value: auth.user, 
      initialData: null,
      child: const MaterialApp(home: WrapperScreen()),
      );
  }
}
