import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
import 'package:the_ex_plat/pages/Setup/signup.dart';
import 'package:the_ex_plat/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new FlutterLogo(
              size: 120.0,
            ),


            Form(
              key: _formKey,
              child: Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.lightBlue,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,fontSize: 20.0
                    )
                  )
                ),
              child: Container(
                padding: EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                        labelText: 'Enter Email'
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),

                  TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'Please provide a valid password';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                        labelText: 'Enter Password'
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  RaisedButton(
                    onPressed: signIn,
                    child: Text('Sign In'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  RaisedButton(
                    onPressed: navigateToSignUp,
                    child: Text('New here? Move To Sign Up'),
                  ),
                ],
              ),
              )
            ),
          ),
        ],
      )
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
       FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }catch(e){
        print(e.message);
      }
    }
  }

  void navigateToSignUp(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}