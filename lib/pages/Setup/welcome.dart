import 'package:flutter/material.dart';
import 'package:the_ex_plat/pages/Setup/signin.dart';
import 'package:the_ex_plat/pages/Setup/signup.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
            Column(
            children: <Widget>[

              ButtonTheme(
                minWidth: 200.0,
                height: 75.0,
                child: RaisedButton(
                  onPressed: navigateToSignUp,
                  textColor: Colors.white,
                  color: Colors.lightBlue,

                  padding: const EdgeInsets.all(10.0),
                  child:
                  const Text('Sign Up', style: TextStyle(fontSize: 30)),

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              ButtonTheme(
                    minWidth: 200.0,
                    height: 75.0,
                child: RaisedButton(
                  onPressed: navigateToSignIn,
                  textColor: Colors.white,
                  color: Colors.lightBlue,

                  padding: const EdgeInsets.all(10.0),
                  child:
                  const Text('Sign In', style: TextStyle(fontSize: 30)),

                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  void navigateToSignIn(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void navigateToSignUp(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}