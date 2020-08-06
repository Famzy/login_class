import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            child: Container(
              height: 50,
              child: Center(child: Text("Sample Data"),),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
              BoxShadow(
                  color:  Colors.grey.shade300,
                  blurRadius: 16,
                  spreadRadius: 0)
            ]
            ),
            child: Container(
              height: 50,
              color: Colors.white,
              child: Center(child: Text("Sample Data"),),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            Container(
              height: 50,
              width: 30,
              color: Colors.red,
            ),
             Container(
              height: 50,
              width: 30,
              color: Colors.yellow,
            ),

            Container(
              color: Colors.green,
              height: 50,
              width: 30,
            ),
          ],),
        ],
        
      ),
    );
  }
}
