import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bs.dart';
import 'cb.dart';
import 'cst.dart';
import 'fj.dart';
import 'cart.dart';

int flag=0;

class Items extends StatefulWidget
{
  Items(value)
  {
    flag=value;
  }
  createState()
  {
    return ItemsState();
  }
}

class ItemsState extends State<Items>
{
  Widget build(context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text("Sign\n out"),
            backgroundColor: Colors.tealAccent,
            onPressed: ()async
            {
              if(flag==1)
              {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              }
              else if(flag==2)
                {
                  GoogleSignIn _googleSignIn = new GoogleSignIn();
                  await _googleSignIn.signOut();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
            },
          ),

          appBar:AppBar(
            backgroundColor: Colors.tealAccent,
            title:Text("Canopy fOOd"),
          ),

          body:Container(
            margin: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[

                //Text(msg[rng.nextInt(3)]),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      elevation:30.0,
                      color: Colors.tealAccent,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: //new Image.network("http://bombaysweets.net/images/logo.png"),
                      Text("Bombay Sweets"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => bs()));
                      },
                    ),
                    Text('   '),
                    RaisedButton(
                      color: Colors.tealAccent,
                      elevation:30.0,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child:// new Image.network("https://content3.jdmagicbox.com/comp/hyderabad/m6/040pxx40.xx40.090905185210.c7m6/catalogue/cream-stone-jubilee-hills-hyderabad-ice-cream-parlours-4ie5c45-250.jpg"),
                      Text("  Cream Stone  "),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => cst()));
                      },
                    ),
                  ],
                ),
                Text('\n'),
                Row(children: <Widget>[
                  RaisedButton(
                    color: Colors.tealAccent,
                    elevation:30.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    child:// new Image.network("https://content3.jdmagicbox.com/comp/hyderabad/m6/040pxx40.xx40.090905185210.c7m6/catalogue/cream-stone-jubilee-hills-hyderabad-ice-cream-parlours-4ie5c45-250.jpg"),
                    Text("  Freshy Juices  "),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => fj()));
                    },
                  ),
                  Text('   '),
                  RaisedButton(
                    color: Colors.tealAccent,
                    elevation:30.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    child:// new Image.network("https://content3.jdmagicbox.com/comp/hyderabad/m6/040pxx40.xx40.090905185210.c7m6/catalogue/cream-stone-jubilee-hills-hyderabad-ice-cream-parlours-4ie5c45-250.jpg"),
                    Text("  Coffee Break  "),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => cb()));
                    },
                  ),
                ],),
                Text("\n\n\n"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.tealAccent,
                      width: 4.0,
                    ),
                  ),
                  child:Column(children: <Widget>[
                    Text("Today's Combo\n----------------------------------------\nCoke(250ml)-->15Rs\nChocoDip-->30Rs\nPomegranate Juice-->30RS\n",
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    RaisedButton(
                      child: Text("Cart"),
                      color: Colors.tealAccent,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      elevation: 20.0,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                      },
                    ),
                  ],)
                ),
              ],
            ),

          ),
        )
    );
  }
}