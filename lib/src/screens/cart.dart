import 'package:flutter/material.dart';

class Cart extends StatelessWidget
{
  List<String> order = new List();

  void addItems(Set<String> value)
  {
    order.addAll(value);
    print("In final cart");
    print(order);
  }

  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Canopy fOOD"),
          backgroundColor: Colors.tealAccent,
        ),

        body: Container(
          margin: EdgeInsets.all(125.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.tealAccent,
              width: 4.0,
            ),
          ),
          child: Text("Order Summary",
            style: TextStyle(fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }
}