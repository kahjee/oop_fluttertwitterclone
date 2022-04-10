import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String creatorid;
  final String text;
  final String id;
  final Timestamp timestamp;

  PostModel({required this.creatorid, required this.text, required this.id, required this.timestamp}); 
}