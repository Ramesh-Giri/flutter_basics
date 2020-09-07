import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              child: Image.network(
                  "https://images.unsplash.com/photo-1580128660010-fd027e1e587a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: null),
            ],
          ),
          Positioned(
            top: 150,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "sept 5,2020     *15:15",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "White House Tried to 'Lockdown' \nUrikine Call Records, \nWhistle-Blower Says",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  source()
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12))),
                child: _builtDetailPanel(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _builtDetailPanel() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                socialMedia(Icon(Icons.favorite)),
                socialMedia(Icon(Icons.favorite)),
                socialMedia(Icon(Icons.favorite)),
                socialMedia(Icon(Icons.favorite)),
                SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.withOpacity(0.40)),
                      child: Center(
                        child: Text(
                          "1757 comments",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.")
          ],
        ),
      ),
    );
  }

  Widget socialMedia(Icon icon) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withOpacity(0.40)),
      child: Center(
          child: IconButton(
        icon: icon,
        onPressed: null,
        color: Colors.black,
      )),
    );
  }

  Widget source() {
    return Row(
      children: [
        Container(
          height: 60,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1552599886-478b60c5fa61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                  fit: BoxFit.cover)),
        ),SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Eileen Sullivan",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),SizedBox(height: 5,),
            Text(
              "WashingTon's Beuro Correspondant",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60),
            ),
          ],
        ),
      ],
    );
  }
}
