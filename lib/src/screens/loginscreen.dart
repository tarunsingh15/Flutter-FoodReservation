import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Items.dart';
import 'ForgotPwd.dart';


int flag;
class LoginScreen extends StatefulWidget
{
  createState()
  {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey=GlobalKey<FormState>();
  String em,pwd;
  GoogleSignIn googleauth=new GoogleSignIn();
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        //backgroundColor: Colors.tealAccent,

        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text("Canopy fOOd"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.assignment_ind),
              onPressed: () {

              },
            ),
          ],
        ),

        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Form(
                  key:formKey,
                  child:Column(
                    children: <Widget>[
                      Text("Hey, Welcome Buddy..;",
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      emailField(),
                      passwordField(),
                      Text("\n"),
                      Container(
                        child:
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("                 "),
                                submitField(),
                                Text("      "),
                                googleField(),
                              ],
                            ),
                            forgotPwd(),
                          ],
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField()
  {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
          icon: new Icon(Icons.email),
          fillColor: Colors.tealAccent,
          labelText: "Email Address",
          hintText: "12001505*@gmail.com"
      ),
      validator: (String value)
      {
        if(!(value.contains("@gmail.com")||value.contains("@GMAIL.COM"))){
          flag=0;
          return "Please enter a valid email";
        }
          flag=1;
      },
      onSaved: (String value)
      {
        print(value);
        em=value;
      },

    );
  }

  Widget passwordField()
  {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
        icon: new Icon(Icons.lock),
        fillColor: Colors.tealAccent,
        labelText: "Password",
        hintText: "Aa9#",
      ),
      obscureText: true,
      validator: (String value)
      {
        if(value.length<=6)
          return "password must be atleast 6 characters";
      },
      onSaved: (String value)
      {
        print(value);
        pwd=value;
      },
    );
  }

  Widget submitField()
  {
    return RaisedButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      elevation: 20.0,
      color:Colors.tealAccent,
      child:Text("Submit"),
      onPressed: ()
      {
        if(formKey.currentState.validate()) {
          formKey.currentState.save();
          FirebaseAuth.instance.signInWithEmailAndPassword(
              email: em, password: pwd).then((signedInUser) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Items(1)));
          }).catchError((E) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Login Error"),
                  content: new Text("Check the email and password"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          });
        }
      },
    );
  }

  Widget googleField()
  {
    return RaisedButton(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        elevation: 20.0,
        color: Colors.tealAccent,
        child:Text("Google"),
        onPressed: ()
        {
          googleauth.signIn().then((result){
            result.authentication.then((googlekey){
              FirebaseAuth.instance.signInWithGoogle(idToken: googlekey.idToken, accessToken: googlekey.accessToken).then((signedInUser){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Items(2)));
              }).catchError((E){print(E);});
            }).catchError((E){print(E);});
          }).catchError((e){print(e);});
        }
    );
  }

  Widget forgotPwd()
  {

    return RaisedButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      elevation:20.0,
      color:Colors.tealAccent,
      child:Text("Forgot pwd ?"),
      onPressed:()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPwd()));
      }
    );
  }

}
