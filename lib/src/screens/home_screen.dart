import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'registration.dart';
import 'loginscreen.dart';

class HomeScreen extends StatefulWidget
{
  createState()
  {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
{
  Widget build(context)
  {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[

         /*Image.asset('Assests/logo.png',
          width: 850.0,
          height: 200.0,),*/
        Image.network("https://www.amsa.org/wp-content/uploads/2018/08/Canopy-Logo.png"),

          Container(
            child: Row(
              children: <Widget>[
                Text("                 "),
                loginField(),
                Text("       "),
                registerField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginField()
  {
  return RaisedButton(
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    elevation: 20.0,
    color:Colors.tealAccent,
    child:Text("Login"),
    onPressed: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    },
  );
  }

  Widget registerField()
  {
    return RaisedButton(
      elevation: 20.0,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      color: Colors.tealAccent,
      child:Text("Register"),
      onPressed: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      }
    );
  }
}
