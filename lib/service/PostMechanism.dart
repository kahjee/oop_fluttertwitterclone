import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitterclone/models/PostModel.dart';

//This file is responsible for the post mechanism for the AddPosts.dart screen. 

class PostMechanism {

  List<PostModel> _postList(QuerySnapshot QuerySnaps){
    dynamic snapshot;
    return snapshot.docs.map((doc) {
      return PostModel(creatorid: doc.data()["creatorid"] ?? "", text: doc.data()["text"] ?? "", id: doc.id, timestamp: doc.data()["timestamp"] ?? 0);
    }).toList();
  }

  Future SavePosts(Text)async{
    await FirebaseFirestore.instance.collection("posts").add({
    'text': Text, 
    'creatorid': FirebaseAuth.instance.currentUser?.uid,
    'time': FieldValue.serverTimestamp()}
    );
  }

  Stream<List<PostModel>> getPosts(uid){
    return FirebaseFirestore.instance.collection("posts").where("creatorid", isEqualTo: uid).snapshots().map(_postList);
  }
}