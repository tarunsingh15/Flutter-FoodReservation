import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/sastra.dart';
import 'screens/aboutus.dart';


class AppScreen extends StatefulWidget
{
  createState()
  {
    return AppScreenState();
  }
}

class AppScreenState extends State<AppScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Sastra(),
    AboutUs(),
  ];

  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:Scaffold(
      //backgroundColor: Colors.tealAccent,

      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text("Canopy fOOd"),
      ),

      body: Center(
        child: _children[_currentIndex],
      ),


      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.tealAccent,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_balance),
            title: new Text('Sastra'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('About us')
          )
        ],

        onTap: onTabTapped,
      ),

     ),
      );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
