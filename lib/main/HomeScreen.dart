import 'package:flutter/material.dart';
import 'package:twitterclone/service/Authentication.dart';

// The HomeScreen is the general home screen of the user. 

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Authentication _authServ = Authentication();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Twitter Home Screen"),
        actions: <Widget>[
          ElevatedButton(onPressed: () async {_authServ.SignOut();}, child: Title(color: Colors.white, child: const Text('Logout')),),
        ],
        ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(child: 
              Text("Welcome to Twitter."), 
              decoration: BoxDecoration(color: Colors.lightBlue,),), 
            ListTile(title: const Text("Posts"), onTap: () {
              Navigator.pushNamed(context, '/PostScreen');
            },),
            ListTile(title: const Text("Logout from Twitter"), onTap: () {
              _authServ.SignOut();
            },),
            ],
        ),),

      floatingActionButton: FloatingActionButton(onPressed:(() {
        Navigator.pushNamed(context, "/add");
      } ), child: const Icon(Icons.add),),

      //The posts and the menu would be displayed using the ListView widget. 

      
    );
  }
}