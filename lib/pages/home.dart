import 'package:flutter/material.dart';
import 'package:the_ex_plat/pages/Setup/buy.dart';
import 'package:the_ex_plat/pages/Setup/sell.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Purpose'),
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
                  onPressed: navigateToBuy,
                  textColor: Colors.white,
                  color: Colors.lightBlue,

                  padding: const EdgeInsets.all(10.0),
                  child:
                  const Text('Buy', style: TextStyle(fontSize: 20)),

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 60.0,
                child: RaisedButton(
                  onPressed: navigateToSell,
                  textColor: Colors.white,
                  color: Colors.lightBlue,

                  padding: const EdgeInsets.all(10.0),
                  child:
                  const Text('Sell', style: TextStyle(fontSize: 20)),

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
                  const Text('Remove The Uploaded Product', style: TextStyle(fontSize: 20)),

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
                  const Text('Display The Cart', style: TextStyle(fontSize: 20)),

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
                  const Text('Settings', style: TextStyle(fontSize: 20)),

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
                  const Text('Feedback', style: TextStyle(fontSize: 20)),

                ),
              ),
            ],
          )
            ),
          ],
    )


    );
  }

void navigateToBuy(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => BuyPage()));
  }

  void navigateToSell(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => UploadProductPage()));
  }

}