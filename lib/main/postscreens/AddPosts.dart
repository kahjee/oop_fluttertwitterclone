import 'package:flutter/material.dart';
import 'package:twitterclone/service/PostMechanism.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({Key? key}) : super(key: key);

  @override
  State<AddPosts> createState() => _AddPostsState();
}

void SnackbarPostAdded() async{
    const SnackBar(content: Text("Tweet added!"));
  }

class _AddPostsState extends State<AddPosts> {

  final PostMechanism _mechanism = PostMechanism();
  String TweetText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add your Tweet'), actions: <Widget>[TextButton(
        onPressed: () async{
          _mechanism.SavePosts(Text);
          Navigator.pop(context);
        }, 
        child: const Text('Tweet'), )
        ],
        ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(child:
        TextFormField(onChanged: (value) {
          setState(() {
            TweetText = value;
          });
        },),),
      ),
    );
  }
}