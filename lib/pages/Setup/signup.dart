import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_ex_plat/pages/Setup/signin.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password, _phoneno, _name;
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
              size: 80.0,
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

                    padding: const EdgeInsets.only(
                      left: 40,
                      top: 20,
                      right: 40,
                      bottom: 20,
                    ),

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
                              labelText: 'Email'
                          ),

                        ),

                        TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Please provide a valid password';
                            }
                          },
                          onSaved: (input) => _password = input,
                          decoration: InputDecoration(
                              labelText: 'Password'
                          ),
                          obscureText: true,
                        ),

                        TextFormField(
                          validator: (input) {
                            if (input.length != 10) {
                              return 'Please enter a 10 digit phone number';
                            }
                          },
                          onSaved: (input) => _phoneno = input,
                          decoration: InputDecoration(
                              labelText: 'Contact Number'
                          ),

                        ),

                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please enter your name';
                            }
                          },
                          onSaved: (input) => _name = input,
                          decoration: InputDecoration(
                              labelText: 'Name'
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),



                        RaisedButton(
                          onPressed: signUp,
                          child: Text('Sign Up'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        RaisedButton(
                          onPressed: navigateToSignIn,
                          child: Text('Already Registered? Move To Sign In'),
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

  Future<void> signUp() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
       FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        user.sendEmailVerification();
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }

   void navigateToSignIn(){
     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}