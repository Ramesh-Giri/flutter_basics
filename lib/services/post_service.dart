import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_workshop/models/feed.dart';

class PostService {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Future<DocumentReference> addPost(Feed feed) {
    CollectionReference _feedReference = _firebaseFirestore.collection('feed');

    var data = {
      'name': feed.uploadedBy,
      'imageUrl': feed.imageUrl,
      'description': feed.description,
      'caption': feed.caption,
      'postDate': feed.postDate,
      'uid': feed.uid
    };
    return _feedReference.add(data);
  }

  static Stream<List<Feed>> fetchPostStream() {
    CollectionReference _feedListReference =
        _firebaseFirestore.collection('feed');
    return _feedListReference.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => Feed.fromJson(e)).toList());
  }

  static Future<List<Feed>> fetchPosts() async {
    CollectionReference _feedListReference =
        _firebaseFirestore.collection('feed');
    var _querySnapshot = await _feedListReference.get();
    return _querySnapshot.docs.map((e) => Feed.fromJson(e)).toList();
  }

  static Future<void> updateLike(String docId, bool likeStatus) {
    DocumentReference _documentReference =
        _firebaseFirestore.collection('feed').doc(docId);
    return _documentReference.update({"like": likeStatus});
  }
}
