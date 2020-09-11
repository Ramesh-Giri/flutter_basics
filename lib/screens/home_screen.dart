import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/feed.dart';
import 'package:flutter_workshop/widgets/feed_card_item.dart';

import 'add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.camera_enhance,
              size: 32.0,
            ),
            SizedBox(width: 10.0),
            Text('Instagram'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: getFeeds().length,
              itemBuilder: (context, index) {
                return FeedCardItem(feed: getFeeds()[index],);
              }),

          Positioned(
            bottom: 10.0,
            left: 50.0,
            right: 50.0,
            child: RaisedButton(
              elevation: 10.0,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)
              ),
              color: Colors.red,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AddPostScreen();
                }));
              },
              child: Text("Post",style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
