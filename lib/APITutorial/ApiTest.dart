import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Modelt> fetchAlbum() async {
  final response =
  await http.get('https://demo3.bujishu.com/api/categories');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Modelt.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Modelt{

  final int id;
  final String name;
  final String slug;
  final int parent_category_id;
  final String created_at;
  final String updated_at;

  Modelt({this.id,this.name,this.slug,this.parent_category_id, this.created_at, this.updated_at});

  factory Modelt.fromJson(Map<String, dynamic> json){
    return Modelt(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      parent_category_id: json['parent_category_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Modelt> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Modelt>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.name);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
