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
      floatingActionButton: FloatingActionButton(onPressed:(() {
        Navigator.pushNamed(context, "/add");
      } ), child: Icon(Icons.add),),
    );
  }
}