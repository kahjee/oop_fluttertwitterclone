import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/main.dart';
import 'package:twitterclone/main/HomeScreen.dart';
import 'package:twitterclone/main/ProfileScreen.dart';
import 'package:twitterclone/main/postscreens/AddPosts.dart';
import 'package:twitterclone/models/UserInfo.dart';
import 'package:twitterclone/screens/SignupScreen.dart';

class WrapperScreen extends StatelessWidget {

  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserInfoModel?>(context);

    if(user == null){
      return SignupScreen();
    }
    
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => const HomeScreen(),
        '/AddPosts':(context) => AddPosts(),
        '/ProfileScreen':(context) => ProfileScreen(), 
      },
    );
  }
}