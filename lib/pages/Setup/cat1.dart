import 'package:flutter/material.dart';
import 'signin.dart';
import 'sell.dart';
import 'Posts.dart';
import 'package:firebase_database/firebase_database.dart';


class cat1 extends StatefulWidget
{
  cat1
  ({
    // this.auth,
    this.onSignedOut,
  });
  // final AuthImplementation auth;
  final VoidCallback onSignedOut;


  @override
  State<StatefulWidget> createState()
  {
    return _cat1State();
  }
}


class _cat1State extends State<cat1>
{
  List<Posts> postsList = [];


@override
void initState()
{
  super.initState();

  DatabaseReference postsRef = FirebaseDatabase.instance.reference().child("Posts");

  postsRef.once().then((DataSnapshot snap)
  {
    var KEYS = snap.value.keys;
    var DATA = snap.value;

    postsList.clear();

    for(var individualKey in KEYS)
    {
      Posts posts = new Posts
      (
       DATA[individualKey]['Image'],
       DATA[individualKey]['category'],
       DATA[individualKey]['price'],
       DATA[individualKey]['description'],
        );

        postsList.add(posts);
    }

    setState(() 
    {
    print("Length : $postsList.length");  
    });
  });
}


  // void _logoutUser() async
  // {
  //  try
  //  {
  //    await widget.auth.signOut();
  //    widget.onSignedOut();
  //  }
  //  catch(e)
  //  {
  //    print(e.toString());
  //  }
  // }


@override
Widget build(BuildContext context)
{
  return new Scaffold
  (
    appBar: new AppBar
    (
      title: new Text("Home"),
    ),

    body: new Container
    (
      child: postsList.length == 0 ? new Text("No Blog Post available") : new ListView.builder
      (
        itemCount: postsList.length,
        itemBuilder: (_, index)
        {
          return PostsUI(postsList[index].image, postsList[index].description, postsList[index].price, postsList[index].category);
        }
      ),
    ),

    bottomNavigationBar: new BottomAppBar
    (
      color: Colors.pink,

      child: new Container
      (
        margin: const EdgeInsets.only(left: 70.0, right: 70.0),

        child: new Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,


          children: <Widget>
          [
            // new IconButton
            // (
            //   icon: new Icon(Icons.local_car_wash),
            //   iconSize: 50,
            //   color: Colors.white,

            //   onPressed: _logoutUser,
            // ),

            new IconButton
            (
              icon: new Icon(Icons.add_a_photo),
              iconSize: 50,
              color: Colors.white,

              onPressed: ()
              {
                Navigator.push
                (
                  context,
                  MaterialPageRoute(builder: (context)
                  {
                    return new UploadProductPage();
                  })
                );
              },
            ),

          ],

            ),

            ),

        ),

      );
}


Widget PostsUI(String image, String category, String price, String description)
{
  return new Card
  (
    elevation: 10.0,
    margin: EdgeInsets.all(15.0),


    child: new Container
    (
      padding: new EdgeInsets.all(14.0),

      child: new Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>
        [
         new Row
         (
           mainAxisAlignment: MainAxisAlignment.spaceBetween,

           children: <Widget>
           [
              new Text
          (
            category,
            style: Theme.of(context).textTheme.subtitle,
            textAlign: TextAlign.center,
          ),

          new Text
          (
            price,
            style: Theme.of(context).textTheme.subtitle,
            textAlign: TextAlign.center,
          )
           ],
         ),

         SizedBox(height: 10.0,),

         new Image.network(image, fit: BoxFit.cover),

         SizedBox(height: 10.0,),

          new Text
          (
            description,
            style: Theme.of(context).textTheme.subhead,
            textAlign: TextAlign.center,
          ),

        ],

      ),



    ),

  );
}
}