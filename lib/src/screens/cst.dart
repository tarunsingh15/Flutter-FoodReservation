import 'package:flutter/material.dart';
import 'cart.dart';

bool iscd= false,isbc=false,iscs=false,isom=false;
Set<String> items2=new Set();

class cst extends StatefulWidget
{
  createState()
  {
    return cstState();
  }
}

class cstState extends State<cst>
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
                Text("   CreamStone\n------------------------",
                  style: TextStyle(
                      fontWeight: FontWeight.w100, fontSize: 30.0),),
                Row(
                  children: <Widget>[
                    Text("1.ChocoDip        -->  30Rs\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: iscd,
                      onChanged: (value) {
                        setState(() {
                          iscd= value;
                          if(iscd==true)
                          {
                            items2.add("ChocoDip");
                          }
                          else
                          {
                            items2.remove("ChocoDip");
                          }
                          print(items2);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("2.BlackCurrent  --> 30Rs\t\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isbc,
                      onChanged: (value) {
                        setState(() {
                          isbc = value;
                          if(isbc==true)
                          {
                            items2.add("BlackCurrent");
                          }
                          else
                          {
                            items2.remove("BlackCurrent");
                          }
                          print(items2);
                        });
                      },
                    ),
                  ],),
                Row(
                  children: <Widget>[
                    Text("3.Cassata          --> 30Rs \t\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: iscs,
                      onChanged: (value) {
                        setState(() {
                          iscs = value;
                          if(iscs==true)
                          {
                            items2.add("Cassatta");
                          }
                          else
                          {
                            items2.remove("Cassata");
                          }
                          print(items2);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("4.Milkshakes     --> 30Rs\t\t\t\t",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),),
                    Checkbox(
                      activeColor: Colors.tealAccent,
                      value: isom,
                      onChanged: (value) {
                        setState(() {
                          isom = value;
                          if(isom==true)
                          {
                            items2.add("MilkShakes");
                          }
                          else
                          {
                            items2.remove("MilkShakes");
                          }
                          print(items2);
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
                    crt.addItems(items2);
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}