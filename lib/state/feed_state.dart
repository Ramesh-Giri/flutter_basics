import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/models/feed.dart';
import 'package:flutter_workshop/services/post_service.dart';
import 'package:flutter_workshop/state/auth_state.dart';

final feedListProvider =
    FutureProvider<List<Feed>>((ref) => PostService.fetchPosts());

final feedListStreamProvider =
    StreamProvider<List<Feed>>((ref) => PostService.fetchPostStream());

final isFeedSavingProvider = StateProvider<bool>((ref) => false);
final addFeedProvider =
    ChangeNotifierProvider<AddFeedNotifier>((ref) => AddFeedNotifier(ref));

class AddFeedNotifier extends ChangeNotifier {
  bool isLoading = false;
  String error;
  ProviderReference ref;

  AddFeedNotifier(this.ref);

  addFeed(Feed feed) async {
    try {
      this.isLoading = true;
      notifyListeners();
      feed.postDate = DateTime.now().millisecondsSinceEpoch;
      feed.uploadedBy = ref.read(userProvider).state.displayName;
      feed.uid = ref.read(userProvider).state.uid;
      await PostService.addPost(feed);
    } catch (error) {
      this.error = error.toString();
    } finally {
      this.isLoading = false;
      notifyListeners();
    }
  }
}
