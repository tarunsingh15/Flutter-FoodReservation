import 'package:flutter/material.dart';
import 'cart.dart';

bool iscj= false,ispj=false,iswj=false,isaj=false;
Set<String> items3=new Set();

class fj extends StatefulWidget
{
  createState()
  {
    return fjState();
  }
}

class fjState extends State<fj>
{
  Widget build(context)
  {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text("Canopy fOOd"),
        ),

        body: Container(
            margin: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.tealAccent,
                width: 4.0,
              ),
            ),
            child: Column(
              children: <Widget>[
                Text("    Fresh Juice\n-----------------------",
                  style: TextStyle(
                      fontWeight: FontWeight.w100, fontSize: 30.0),),
                Row(
                  children: <Widget>[
                    Text("1.Carrot        -->  30Rs\t\t\t\t\t\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: iscj,
                      onChanged: (value) {
                        setState(() {
                          iscj = value;
                          if(iscj==true)
                          {
                            items3.add("Carrot");
                          }
                          else
                          {
                            items3.remove("Carrot");
                          }
                          print(items3);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("2.Pomegranate   --> 30Rs\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: ispj,
                      onChanged: (value) {
                        setState(() {
                          ispj = value;
                          if(ispj==true)
                          {
                            items3.add("Pomegranate");
                          }
                          else
                          {
                            items3.remove("Pomegranate");
                          }
                          print(items3);
                        });
                      },
                    ),
                  ],),
                Row(
                  children: <Widget>[
                    Text("3.Watermelon    --> 30Rs\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: iswj,
                      onChanged: (value) {
                        setState(() {
                          iswj = value;
                          if(iswj==true)
                          {
                            items3.add("WaterMelon");
                          }
                          else
                          {
                            items3.remove("WaterMelon");
                          }
                          print(items3);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("4.Apple             --> 10Rs\t\t\t\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isaj,
                      onChanged: (value) {
                        setState(() {
                          isaj = value;
                          if(isaj==true)
                          {
                            items3.add("Apple");
                          }
                          else
                          {
                            items3.remove("Apple");
                          }
                          print(items3);
                        });
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.tealAccent,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text("Add to Cart"),
                  onPressed: () {
                    Cart crt=new Cart();
                    crt.addItems(items3);
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}