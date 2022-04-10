import 'package:flutter/material.dart';
import 'package:twitterclone/service/Authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Authentication _authServ = Authentication();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          ElevatedButton(onPressed: () async {_authServ.SignOut();}, child: Title(color: Colors.white, child: Text('Logout')),),
        ],
        ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: 
              Text("Welcome to Twitter."), 
              decoration: BoxDecoration(color: Colors.lightBlue,),), 
            ListTile(title: Text("Your Posts."), onTap: () {
              Navigator.pushNamed(context, '/UserProfile');
            },),
            ListTile(title: Text("Logout from Twitter"), onTap: () {
              _authServ.SignOut();
            },),
            ],
        ),),

      floatingActionButton: FloatingActionButton(onPressed:(() {
        Navigator.pushNamed(context, "/add");
      } ), child: Icon(Icons.add),),

      //The posts and the menu would be displayed using the ListView widget. 

      
    );
  }
}