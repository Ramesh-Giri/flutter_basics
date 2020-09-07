import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: null),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "you are not a suscriber.",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.40)),
                  child: Center(
                    child: Text(
                      "See options",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),
                    ),
                  ),
                )
              ],
            ),SizedBox(
              height: 10,
            ),
            readerCard(context),
            SizedBox(
              height: 10,
            ),
            catalogRow(context),
            SizedBox(
              height: 10,
            ),
            breakingNewsList(context)
          ],
        ),
      ),
    );
  }
  Widget readerCard(context){
    return Container(
          margin: EdgeInsets.all(6),
          padding: EdgeInsets.all(9),
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1514810771018-276192729582?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                  fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      "The NewYork Time Sale.",
                      style: TextStyle(fontSize: 15, ),
                    ),SizedBox(
              height: 10,
            ),
                    Text(
                      "Readers in Europe Suscribe\nfor 4 weeks free,then 50%off.",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold ),
                    ),SizedBox(
              height: 10,
            ),
                    Text(
                      "Ends soon",
                      style: TextStyle(fontSize: 15,color: Colors.black54),
                    ),SizedBox(
              height: 10,
            ),
                    Container(
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      "Get readers now",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ,color: Colors.white),
                    ),
                  ),
                )
                  ],),
        );
  }

  Widget catalogRow(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
                "My Newsletters",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Container(
                height: 25,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.40)),
                child: Center(
                  child: Text(
                    "Show catalogue",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),
                  ),
                ),
              )
      ],
    );
  }

  Widget breakingNewsList(context){
    return Expanded(
          child: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx,i){
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "Breaking News Alert",
                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                    ],
                  ),
                  Text(
                        "Stay informed as soon as important news breaks around the world",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                ],
              ),
            ),
            SizedBox(height: 10,)
          ],
        );
      }),
    );
  }
}
