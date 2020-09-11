class Feed {
  String uploadedBy;
  String subTitle;
  String profileImage;
  String postImage;
  String caption;
  String description;
  bool like;
  bool save;
  int commentCount;

  Feed(
      {this.uploadedBy,
      this.subTitle,
      this.profileImage,
        this.postImage,
      this.caption,
      this.description,
      this.like,
      this.save,
      this.commentCount});
}

List<Feed> getFeeds() {

  List<Feed> allFeeds = [];

  Feed feed1 = Feed(
    uploadedBy: "Test person 1",
    subTitle: "Admin",
    profileImage: 'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.0-9/117436570_101417711683280_1138836161271393737_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_ohc=wWAP4Es26yEAX_Mt4tw&_nc_ht=scontent.fktm10-1.fna&oh=e2d1df771169e572d5a1c3e74cf32b54&oe=5F772E75',
    postImage: 'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
      caption: "THis is caption 1",
    description: 'This is desc',
    like: false,
    save: false,
    commentCount: 10,
  );

  Feed feed2 = Feed(
    uploadedBy: "Test person 2",
    subTitle: "Admin",
    profileImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F454571015482650624%2FQxTB_fIk.jpeg&f=1&nofb=1',
    postImage: 'https://images.unsplash.com/photo-1599021277840-9d3f4f383742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    caption: "THis is caption 1",
    description: 'This is desc',
    like: false,
    save: false,
    commentCount: 10,
  );

  Feed feed3 = Feed(
    uploadedBy: "Test person 2",
    subTitle: "Admin",
    profileImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F454571015482650624%2FQxTB_fIk.jpeg&f=1&nofb=1',
    postImage: 'https://images.unsplash.com/photo-1599021277840-9d3f4f383742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    caption: "THis is caption 1",
    description: 'This is desc',
    like: false,
    save: false,
    commentCount: 10,
  );

  Feed feed4 = Feed(
    uploadedBy: "Test person 2",
    subTitle: "Admin",
    profileImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F454571015482650624%2FQxTB_fIk.jpeg&f=1&nofb=1',
    postImage: 'https://images.unsplash.com/photo-1599021277840-9d3f4f383742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    caption: "THis is caption 1",
    description: 'This is desc',
    like: false,
    save: false,
    commentCount: 10,
  );

  allFeeds.add(feed1);
  allFeeds.add(feed2);
  allFeeds.add(feed3);
  allFeeds.add(feed4);


  return allFeeds;
}

/*

imageUrl:
'https://images.unsplash.com/photo-1567337710282-00832b415979?ixlib=rb-1.2.1&auto=format&fit=crop&w=3888&q=80',

uploaderImageUrl:
'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FHqMxT0guGuI%2Fmaxresdefault.jpg&f=1&nofb=1',

imageUrl:
'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80’,


uploaderImageUrl:
'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.0-9/117436570_101417711683280_1138836161271393737_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_ohc=wWAP4Es26yEAX_Mt4tw&_nc_ht=scontent.fktm10-1.fna&oh=e2d1df771169e572d5a1c3e74cf32b54&oe=5F772E75',
  */
