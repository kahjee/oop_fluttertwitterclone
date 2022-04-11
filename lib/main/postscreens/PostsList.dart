import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/PostModel.dart';

// The PostsList would provide the user with a list of the posts that they have made. 

class PostsList extends StatefulWidget {
  PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {

    final TotalPosts = Provider.of<List<PostModel>>(context);

    //The ListView would allow the posts to be shows in a linear horizopntal manner. The ListTile is a tile in the ListView list that has text.

    return ListView.builder(
      itemCount: TotalPosts.length,
      itemBuilder: (context, index){

        final FinalPost = TotalPosts[index];
        
        return ListTile(
          title: Text(FinalPost.creatorid),
          subtitle: Text(FinalPost.text),
        );
      },
    );
  }
}