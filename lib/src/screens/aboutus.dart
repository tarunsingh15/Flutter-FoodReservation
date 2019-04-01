import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget
{
  Widget build(context)
  {
    return Scaffold(
      body:Container(
        margin: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.tealAccent,
                  width: 4.0,
                ),
              ),
              child: Text("This application is developed as a part \n of Software Engineering Project",
                style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Text("\n"),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.tealAccent,
                  width: 4.0,
                ),
              ),
              child: Text("team:\n------------------------------\n K.Chaitanya \n 120015054 \n Information Technology \n ------------------------------\n B. Chaitanya \n 120015017 \n Information Technology",
                style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}