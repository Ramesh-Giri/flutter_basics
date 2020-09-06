import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/feed.dart';

class FeedDetailScreen extends StatelessWidget {

  final Feed feed;
      FeedDetailScreen({this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        title: Row(
          children: [
            Text(feed.uploadedBy),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            feed.caption,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
