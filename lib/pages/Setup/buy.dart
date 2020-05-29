import 'package:flutter/material.dart';
import 'cat1.dart';

class BuyPage extends StatefulWidget{
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Category'),
        ),

        backgroundColor: Colors.black45,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 10,
                  right: 40,
                  bottom: 10,
                ),
                child: Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: navigateToCat1,
                        textColor: Colors.white,
                        color: Colors.lightBlue,

                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Electronic Gadgets', style: TextStyle(fontSize: 20)),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: (){},
                        textColor: Colors.white,
                        color: Colors.lightBlue,

                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Buckets and other things', style: TextStyle(fontSize: 20)),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: (){},
                        textColor: Colors.white,
                        color: Colors.lightBlue,

                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Mattresses and Stuff', style: TextStyle(fontSize: 20)),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: (){},
                        textColor: Colors.white,
                        color: Colors.lightBlue,

                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Others', style: TextStyle(fontSize: 20)),

                      ),
                    ),

                  ],
                )
            ),
          ],
        )
    );
  }
  void navigateToCat1(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => cat1()));
  }
}