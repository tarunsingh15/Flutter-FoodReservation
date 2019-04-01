import 'package:flutter/material.dart';
import 'cart.dart';

bool isc= false,isb=false,isf=false,isk=false;
Set<String> items4=new Set();

class cb extends StatefulWidget
{
  createState()
  {
    return cbState();
  }
}

class cbState extends State<cb>
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
                Text("    Coffee Break\n-----------------------",
                  style: TextStyle(
                      fontWeight: FontWeight.w100, fontSize: 30.0),),
                Row(
                  children: <Widget>[
                    Text("1.Cappuccino     -->  30Rs\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isc,
                      onChanged: (value) {
                        setState(() {
                          isc = value;
                          if(isc==true)
                          {
                            items4.add("Cappuccino");
                          }
                          else
                          {
                            items4.remove("Cappuccino");
                          }
                          print(items4);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("2.Black Coffee   --> 30Rs \t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isb,
                      onChanged: (value) {
                        setState(() {
                          isb= value;
                          if(isb==true)
                          {
                            items4.add("BlackCoffee");
                          }
                          else
                          {
                            items4.remove("BlackCoffee");
                          }
                          print(items4);
                        });
                      },
                    ),
                  ],),
                Row(
                  children: <Widget>[
                    Text("3.Filter Coffee    --> 30Rs \t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isf,
                      onChanged: (value) {
                        setState(() {
                          isf= value;
                          if(isf==true)
                          {
                            items4.add("FilterCoffee");
                          }
                          else
                          {
                            items4.remove("FilterCoffee");
                          }
                          print(items4);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("4.Kopi Luwak      --> 100Rs\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isk,
                      onChanged: (value) {
                        setState(() {
                          isk = value;
                          if(isk==true)
                          {
                            items4.add("KopiLuwak");
                          }
                          else
                          {
                            items4.remove("KopiLuwak");
                          }
                          print(items4);
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
                    crt.addItems(items4);
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}