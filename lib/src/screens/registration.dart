import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/usermanagement.dart';


class RegisterScreen extends StatefulWidget
{
  createState()
  {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final formKey=GlobalKey<FormState>();
  String em,pwd;

  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        //backgroundColor: Colors.tealAccent,

        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text("Canopy fOOd"),
        ),

        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Form(
                  key:formKey,
                  child:Column(
                    children: <Widget>[
                      Text("Enter valid credentials",
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      emailField(),
                      passwordField(),
                      Text("\n"),
                      submitField(),
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
      autofocus: true,
      decoration:InputDecoration(
        icon: new Icon(Icons.email),
          fillColor: Colors.tealAccent,
          labelText: "Email Address",
          hintText: "12001505*@gmail.com"
      ),
      validator: (String value)
      {
        if(!(value.contains("@gmail.com")||value.contains("@GMAIL.COM"))){
          return "Please enter a valid email";
        }

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

          FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: em, password: pwd).then((signedInUser) {
            UserManagement().storeNewUser(signedInUser, context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Registration"),
                  content: new Text("Successful registration"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }).catchError((e) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("User Error"),
                  content: new Text("Email already exists"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("Try"),
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

}
