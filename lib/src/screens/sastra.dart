import 'package:flutter/material.dart';

class Sastra extends StatelessWidget
{
  Widget build(context)
  {
    return Scaffold(
        body:Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset('Assests/sastra.png',
                width: 850.0,
                height: 200.0,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.tealAccent,
                    width: 4.0,
                  ),
                ),
                child: Text("""The Shanmugha Arts, Science, Technology & Research Academy,also known as SASTRA, is a deemed to be university in the town of Thirumalaisamudram, Thanjavur district, Tamil Nadu, India""",
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
                child: Text("Vice-Chancellor:  S.Vaidhyasubramania Affiliation:  University Grants CommissionChancellor:  Ramachandran Total enrollment:  9,000 (2010)",
                  style: TextStyle(fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
    );
  }
}