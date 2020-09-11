import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/feed.dart';
import 'package:flutter_workshop/widgets/post_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.camera_enhance),
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: getFeeds().length,   // 2
        itemBuilder: (context, index){
          return PostItem(feed: getFeeds()[index]);
        },
      ),
    );
  }
}
