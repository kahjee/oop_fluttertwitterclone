import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/main/postscreens/PostsList.dart';
import 'package:twitterclone/service/PostMechanism.dart';

// The PostScreen is a screen in which the posts would be delivered and shown to the user using the ListView widget in PostsList.dart

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final PostMechanism _postMechanism = PostMechanism();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(value: _postMechanism.getPosts(FirebaseAuth.instance.currentUser!.uid), initialData: [],
    child: Scaffold(
       body: PostsList(),
    ),);
  }
}