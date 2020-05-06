import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Modelt>> fetchAlbum() async {
  final response = await http.get('https://demo3.bujishu.com/api/categories');

//  if (response.statusCode == 200) {
////    // If the server did return a 200 OK response,
////    // then parse the JSON.
////    return Modelt.fromJson(json.decode(response.body));
////  } else {
////    // If the server did not return a 200 OK response,
////    // then throw an exception.
////    throw Exception('Failed to load album');
////  }

  final responseJson = json.decode(response.body);

  return (responseJson as List)
      .map((e) => Modelt.fromJson((e as Map).map(
            (k, e) => MapEntry(k as String, e),
          )))
      .toList();
}

class Picture {
  String image;

  Picture({
    this.image,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      image: json['imageUrl'],
    );
  }
}

class Modelt {
  final int id;
  final String name;
  final int parentCategoryId;
  final Picture image;

  Modelt({
    this.id,
    this.name,
    this.parentCategoryId,
    this.image,
  });

  factory Modelt.fromJson(Map<String, dynamic> json) {
    return new Modelt(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      image: Picture.fromJson(json['image']),
    );
  }
}

class Modelist {
  List<Modelt> model;

  Modelist({
    this.model,
  });
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Modelt>> futureAlbum;

  List<Try> trylist = [
    Try(name: 'q'),
    Try(name: 'w'),
  ];

  List<Modelt> modellist;

  List<String> namelist;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example 1'),
        ),
        body: Center(
            child: FutureBuilder<List<Modelt>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.map((model) {
                  return Image.network(
                    model.image.image,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )

            /*child: ListView.builder(
              itemCount: trylist.length,
              itemBuilder: (context, index) {
                final item = trylist[index];
                return Text(item.name);
              }),*/
            ),
      ),
    );
  }
}

class Try {
  String name;

  Try({this.name});
}
