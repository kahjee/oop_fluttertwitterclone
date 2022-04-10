import 'package:flutter/material.dart';
import 'package:twitterclone/service/PostMechanism.dart';

class AddPosts extends StatefulWidget {
  AddPosts({Key? key}) : super(key: key);

  @override
  State<AddPosts> createState() => _AddPostsState();
}

void SnackbarPostAdded() async{
    SnackBar(content: const Text("Tweet added!"));
  }

class _AddPostsState extends State<AddPosts> {

  final PostMechanism _mechanism = PostMechanism();
  String TweetText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add your Tweet'), actions: <Widget>[TextButton(
        onPressed: () async{
          _mechanism.SavePosts(Text);
          Navigator.pop(context);
        }, 
        child: Text('Tweet'), )
        ],
        ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: new Form(child:
        TextFormField(onChanged: (value) {
          setState(() {
            TweetText = value;
          });
        },),),
      ),
    );
  }
}