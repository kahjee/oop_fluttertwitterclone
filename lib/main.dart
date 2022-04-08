import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/main/HomeScreen.dart';
import 'package:twitterclone/models/TwitterUser.dart';
import 'package:twitterclone/screens/SignupScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitterclone/screens/WrapperScreen.dart';
import 'package:twitterclone/service/Authentication.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _init = Firebase.initializeApp(); 
  // MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError){
          SnackbarError();
        }

        if (snapshot.connectionState == ConnectionState.done){
          return StreamProvider<TwitterUserModel?>.value(
          value: Authentication().user, 
          initialData: null,
          child: const MaterialApp(home: WrapperScreen()),
          );
        }
    return Text('test');
  });
}
}
