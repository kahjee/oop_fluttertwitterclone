import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PostMechanism {
  Future SavePost(Text)async{
    await FirebaseFirestore.instance.collection('posts').add({
    'text': Text, 
    'creatorid': FirebaseAuth.instance.currentUser?.uid,
    'time': FieldValue.serverTimestamp()}
    );
  }
}