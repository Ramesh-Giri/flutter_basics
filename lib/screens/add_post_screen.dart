import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/models/feed.dart';
import 'package:flutter_workshop/state/feed_state.dart';

class AddPostMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildButton(context),);
  }

  buildButton(BuildContext context){
    return RaisedButton(onPressed: null);
  }
}


class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Feed feed;
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    feed = Feed();
  }

  onPostAdd() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var feedProvider = context.read(addFeedProvider);
      await feedProvider.addFeed(feed);
      if (feedProvider.error != null) {
        // show error
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text(feedProvider.error)));
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        title: Text('Add New Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//                Text(
//                  'Name',
//                  style: TextStyle(color: Colors.white),
//                ),
//                TextFormField(
//                  onSaved: (name) => feed.uploadedBy = name,
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'This field cannot be empty';
//                    } else {
//                      return null;
//                    }
//                  },
//                  style: TextStyle(color: Colors.white),
//                  decoration: InputDecoration(
//                    hintText: "Name here",
//                    hintStyle: TextStyle(color: Colors.grey),
//                  ),
//                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Image Url',
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  onSaved: (value) => feed.imageUrl = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Add Image Url",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Caption',
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  onSaved: (value) => feed.caption = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Caption",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Description',
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  onSaved: (value) => feed.description = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Description here",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(child: Consumer(
                  builder: (context, watch, child) {
                    var isLoading = watch(addFeedProvider).isLoading;
                    return isLoading
                        ? CircularProgressIndicator()
                        : RaisedButton(
                            onPressed: this.onPostAdd,
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('Save'),
                          );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
