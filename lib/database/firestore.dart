/*

this class (database) stores the posts that are created by users

each post will have:
 - Email of the user
 - Post message
 - Timestamp of the post

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // Posts collection
  final CollectionReference postCollection = FirebaseFirestore.instance
      .collection('Posts');

  // Create post method
  Future<void> addPost(String message) {
    return postCollection.add({
      "UserEmail": currentUser!.email,
      "PostMessage": message,
      "TimeStamp": Timestamp.now(),
    });
  }

  // Get all posts
  Stream<QuerySnapshot> getPostsStream() {
    return postCollection.orderBy('TimeStamp', descending: true).snapshots();
  }
}
