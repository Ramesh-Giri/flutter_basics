import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_workshop/models/feed.dart';

class PostService {

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Future<DocumentReference> addPost(Feed feed){

    CollectionReference _feedReference = _firebaseFirestore.collection('feed');

    var data = {
      'name' : feed.uploadedBy,
      'imageUrl': feed.imageUrl,
      'description': feed.description,
      'caption': feed.caption,
      'postDate':  feed.postDate,
      'uid': feed.uid
    };
    return  _feedReference.add(data);
  }

}