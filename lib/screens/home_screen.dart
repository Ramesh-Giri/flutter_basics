import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/services/auth_service.dart';
import 'package:flutter_workshop/state/auth_state.dart';
import 'package:flutter_workshop/state/feed_state.dart';
import 'package:flutter_workshop/widgets/feed_card_item.dart';

import 'add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  var itemList;
  @override
  void initState() {
    super.initState();
//    itemList = getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final user = watch(userProvider).state;
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
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  print("logging out");
                  await AuthService.logOut();
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              if (user != null)
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Colors.white,
                    height: 80,
                    child: ListTile(
                      title: Text(user.email),
                    ),
                  ),
                ),
              _buildFeedStreamList(),
//              _buildFeedList(),
              Positioned(
                bottom: 10.0,
                left: 50.0,
                right: 50.0,
                child: RaisedButton(
                  elevation: 10.0,
                  padding: EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.red,
                  onPressed: () async {
                    var feedItem = await Navigator.push(context,
                        MaterialPageRoute(builder: (xcontext) {
                      return AddPostScreen();
                    }));

                    print('FEED ITEM =========== ${feedItem.uploadedBy}');
//                    setState(() {
//                      itemList.add(feedItem);
//                    });
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeedStreamList() {
    return Consumer(builder: (context, watch, child) {

      return watch(feedListStreamProvider).when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stacktrace) {
          print(stacktrace);
          print('error type ${error is FirebaseException}, === ${error}');
          String errorMessage = "";
          if(error is FirebaseException && error.code == "permission-denied") {
            errorMessage = "You dont have permission. Login and retry";
          }
          return Center(
            child: InkWell(
              onTap: () => context.refresh(feedListStreamProvider),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        },
        data: (feedList) {
          print('build data $feedList');
          return RefreshIndicator(
            onRefresh: () async => context.refresh(feedListStreamProvider),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 50.0),
              itemCount: feedList.length,
              itemBuilder: (context, index) {
                return FeedCardItem(
                  feed: feedList[index],
                );
              }),
          );
        },
      );
    });
  }

  Widget _buildFeedList() {
    return Consumer(builder: (context, watch, child) {
      return watch(feedListProvider).when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stacktrace) {
          print(stacktrace);
          return Center(
            child: InkWell(
              onTap: () => context.refresh(feedListProvider),
              child: Text(
                error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        },
        data: (feedList) => ListView.builder(
            padding: EdgeInsets.only(bottom: 50.0),
            itemCount: feedList.length,
            itemBuilder: (context, index) {
              return FeedCardItem(
                feed: feedList[index],
              );
            }),
      );
    });
  }
}
