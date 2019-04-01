import 'package:flutter/material.dart';
import 'cart.dart';

bool ismc= false,isbn=false,isds=false,isss=false;
Set<String> items=new Set();

class bs extends StatefulWidget
{
  createState()
  {
    return bsState();
  }
}

class bsState extends State<bs>
{
  Widget build(context)
  {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title:Text("Canopy fOOd"),
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
              Text(" Bombay Sweets\n-------------------------",
                style: TextStyle(fontWeight: FontWeight.w100,fontSize: 30.0),),
              Row(
                children: <Widget>[
                  Text("1.Motichur        -->  10Rs\t\t\t\t",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  Checkbox(
                    activeColor: Colors.tealAccent,
                    value: ismc,
                    onChanged: (value) {
                      setState(() {
                        ismc = value;
                        if(ismc==true)
                        {
                          items.add("MotiChur");
                         //Cart(items).order.add("MotiChur");
                        }
                        else
                          {
                            items.remove("MotiChur");
                           // Cart(items).order.remove("MotiChur");
                          }
                        print(items);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("2.Butter Naan   --> 50Rs\t\t\t\t\t",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  Checkbox(
                    activeColor: Colors.tealAccent,
                    value: isbn,
                    onChanged: (value) {
                      setState(() {
                        isbn = value;
                        if(isbn==true)
                        {
                          items.add("ButterNaan");
                          //Cart(items).order.add("ButterNaan");
                        }
                        else
                        {
                          items.remove("ButterNaan");
                          //Cart(items).order.remove("ButterNaan");
                        }
                        print(items);
                      });
                    },
                  ),
                ],),
              Row(
                children: <Widget>[
                  Text("3.Dosa               --> 30Rs\t\t\t\t\t\t",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  Checkbox(
                    activeColor: Colors.tealAccent,
                    value: isds,
                    onChanged: (value) {
                      setState(() {
                        isds = value;
                        if(isds==true)
                        {
                          items.add("Dosa");
                          //Cart(items).order.add("Dosa");
                        }
                        else
                        {
                          items.remove("Dosa");
                          //Cart(items).order.remove("Dosa");
                        }
                        print(items);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("4.Samosa         --> 10Rs\t\t\t\t\t\t",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  Checkbox(
                    activeColor: Colors.tealAccent,
                    value: isss,
                    onChanged: (value) {
                      setState(() {
                        isss = value;
                        if(isss==true)
                        {
                          items.add("Samosa");
                          //Cart(items).order.add("Samosa");
                        }
                        else
                        {
                          items.remove("Samosa");
                          //Cart(items).order.remove("Samosa");
                        }
                        print(items);
                      });
                    },
                  ),
                ],
              ),
              RaisedButton(
                color:Colors.tealAccent,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: Text("Add to Cart"),
                onPressed: (){
                  Cart crt=new Cart();
                  crt.addItems(items);
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}