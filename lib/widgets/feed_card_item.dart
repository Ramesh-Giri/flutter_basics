import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/feed.dart';
import 'package:flutter_workshop/screens/feed_detail_screen.dart';

class FeedCardItem extends StatefulWidget {
  final Feed feed;

  FeedCardItem({@required this.feed});

  @override
  _FeedCardItemState createState() => _FeedCardItemState();
}

class _FeedCardItemState extends State<FeedCardItem> {
  bool like, save, sendButton;

  @override
  void initState() {
    super.initState();
    like = widget.feed.like;  //false
    save = widget.feed.save;  //false;
    sendButton = false;
  }

  toggleLike() {
    setState(() {
      like = !like;
    });
    widget.feed.like = like;
  }

  toggleSave() {
    setState(() {
      save = !save;
    });
    widget.feed.save = save;
  }

  toggleSend() {
    setState(() {
      sendButton = !sendButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => FeedDetailScreen(feed: widget.feed)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopPart(),
            _buildImagePart(),
            SizedBox(
              height: 10.0,
            ),
            _buildReactions(),
            SizedBox(
              height: 10.0,
            ),
            _buildCaption(),
            SizedBox(
              height: 10.0,
            ),
            _buildCommentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(widget.feed.uploaderImageUrl ?? ''),
              ),
              SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.feed.uploadedBy,
                    style: TextStyle(color: Colors.white),
                  ),
                  widget.feed.sponsored
                      ? Text(
                          "Sponsored",
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        )
                      : SizedBox(),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  _buildImagePart() {
    return InkWell(
        onDoubleTap: toggleLike,
        child: Image.network(
          widget.feed.imageUrl ?? '',
          height: 280.0,
          fit: BoxFit.cover,
        ));
  }

  _buildReactions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              tapIcon(like ? Icons.favorite : Icons.favorite_border, toggleLike,
                  like ? Colors.red : Colors.white),
              SizedBox(
                width: 15.0,
              ),

              tapIcon(Icons.comment, () {}, Colors.white),


              SizedBox(
                width: 18.0,
              ),
              tapIcon(Icons.send, () {}, Colors.white),
            ],
          ),
          tapIcon(save ? Icons.bookmark : Icons.bookmark_border, toggleSave,
              Colors.white),
        ],
      ),
    );
  }

  Widget tapIcon(IconData iconData, var onTap, iconColor) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        color: iconColor,
        size: 28.0,
      ),
    );
  }

  _buildCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: widget.feed.uploadedBy,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: ' ${widget.feed.caption}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
              ])),


          SizedBox(
            height: 5.0,
          ),

          if(widget.feed.commentsCount > 0)
              Text(
                  'View all ${widget.feed.commentsCount} comments',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                )

        ],
      ),
    );
  }

  _buildCommentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12.0,
                backgroundImage: NetworkImage(widget.feed.uploaderImageUrl ?? ''),
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        sendButton = false;
                      });
                    } else {
                      setState(() {
                        sendButton = true;
                      });
                    }
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add a comment...',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.4))),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              sendButton
                  ? IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  : SizedBox()
            ],
          ),
          Text(
            '${widget.feed.timeAgo}',
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10.0),
          )
        ],
      ),
    );
  }
}
