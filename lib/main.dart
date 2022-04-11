import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/models/TwitterUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitterclone/screens/WrapperScreen.dart';
import 'package:twitterclone/service/Authentication.dart';
import 'firebase_options.dart';

// The main.dart file is the main file of the whole project. 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _init = Firebase.initializeApp(); 
  MyApp({Key? key}) : super(key: key);
  

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
    return const Text('Test text. Ignore this.', textDirection: TextDirection.ltr,);
  });
}
}
