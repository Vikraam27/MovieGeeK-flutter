import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 60.0),
            child: Center(
              child: Container(
                width: 190.0,
                height: 190.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png"))),
              ),
            ),
          ),
          Container(
            child: Column(
              
              children: [
                Text("Name   : Vikram                        .", style: TextStyle(fontSize: 20.0),),
                Text("Age    : 20                                  .", style: TextStyle(fontSize: 20.0),),
                Text("TTL    : Bogor, 27th Sept 2000", style: TextStyle(fontSize: 20.0),),               
                Text("E-mail : ramvik36@gmail.com", style: TextStyle(fontSize: 20.0),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
