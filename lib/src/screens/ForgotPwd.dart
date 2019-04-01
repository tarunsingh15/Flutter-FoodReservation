import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotPwd extends StatefulWidget
{
  createState()
  {
    return ForgotPwdState();
  }
}

class ForgotPwdState extends State<ForgotPwd>
{
  int flag;
  String em;
  final formKey=GlobalKey<FormState>();
  Widget build(context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text("Canopy fOOd"),
          backgroundColor: Colors.tealAccent,
        ),

        body:Container(
          margin: EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Form(
                key:formKey,
                child:TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:InputDecoration(
                    icon: new Icon(Icons.lock),
                    fillColor: Colors.tealAccent,
                    labelText: "mail",
                    hintText: "*********@gmail.com",
                  ),
                  validator: (String value)
                  {
                    if(!(value.contains("@gmail.com")||value.contains("@GMAIL.COM")))
                    {
                      flag=0;
                      return "Enter registered email";
                    }
                    flag=1;
                  },
                  onSaved: (String value)
                  {
                    print(value);
                    em=value;
                  },
                ),
              ),
          RaisedButton(
            color: Colors.tealAccent,
            elevation: 30.0,
            child: Text("Ok"),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: ()async
            {
              if(formKey.currentState.validate())
              {
                formKey.currentState.save();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Forgot Password"),
                    content: new Text("Mail has been sent to your registered mail"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("Ok"),
                        onPressed: ()async
                        {if(flag==1)
                        {
                          await FirebaseAuth.instance.sendPasswordResetEmail(email:em);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                        },
                      ),
                    ],
                  );
                },
              );
              }
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}