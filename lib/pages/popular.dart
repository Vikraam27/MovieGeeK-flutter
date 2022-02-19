import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Popular extends StatelessWidget {
  final String apiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=5f793d033ea33558e13b3664b3eadca9";

  Future<List<dynamic>> fetchMovie() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['results'];
  }

  String _name(dynamic movie) {
    return movie['original_title'];
  }

  String _relaseDate(dynamic movie) {
    return movie['release_date'];
  }

  String _overview(dynamic movie) {
    return movie['overview'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchMovie(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(_overview(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[900],
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            padding: new EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  "https://image.tmdb.org/t/p/w500/" +
                                      snapshot.data[index]['poster_path']),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 240,
                                  height: 25,
                                  child: Text(_name(snapshot.data[index]),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500)),
                                ),
                                new Padding(padding: const EdgeInsets.all(1.0)),
                                Text(_relaseDate(snapshot.data[index])),
                                new Padding(padding: const EdgeInsets.all(7.0)),
                                Container(
                                  width: 256,
                                  height: 45,
                                  child: Text(
                                    _overview(snapshot.data[index]),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}