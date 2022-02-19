import 'package:flutter/material.dart';

import 'pages/top_rated.dart'   as topRated;
import './pages/popular.dart'  as popular;
import './pages/trending.dart' as trending;
import './pages/upcoming.dart' as upcoming;
import './pages/user.dart';
void main(){
  runApp(
    MaterialApp(
      title: "MovieGeeK",
      home: new MyApp(),
      theme: ThemeData.dark(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("MovieGeek"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return User();
            }))
          })
        ],
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          topRated.TopRated(),
          popular.Popular(),
          trending.Trending(),
          upcoming.Upcoming()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueGrey[900],
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.thumb_up_off_alt, size: 20.0,),
              text: "Top Rated",
              
            ),
            new Tab(
              icon: new Icon(Icons.local_fire_department_sharp, size: 20.0,),
              text: "Popular",
            ),
            new Tab(
              icon: new Icon(Icons.trending_up, size: 20.0,),
              text: "Trending",
            ),
            new Tab(
              icon: new Icon(Icons.calendar_today_rounded, size: 20.0,),
              text: "Upcoming",
            ),
          ],
        ),
      ),
    );
  }
}