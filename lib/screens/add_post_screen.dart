import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/feed.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Feed feed;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    feed = Feed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        title: Text('Add New Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Name here",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Image Url',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _imageController,
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
            TextField(
              controller: _captionController,
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
            TextField(
              controller: _descriptionController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Description here",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  feed.uploadedBy = _nameController.text.toString();
                  feed.imageUrl = _imageController.text.toString();
                  feed.caption = _captionController.text.toString();
                  feed.description = _descriptionController.text.toString();

                  setState(() {
                    getFeeds().add(feed);
                  });

                  Navigator.pop(context);
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
