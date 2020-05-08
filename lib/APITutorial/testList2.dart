import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ProductCat> fetchAlbum() async {
  final response =
      await http.get('https://demo3.bujishu.com/api/categories/7/childs');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ProductCat.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }

  final responseJson = json.decode(response.body);

//  return (responseJson as List)
//      .map((e) => ProductCat.fromJson((e as Map).map(
//        (k, e) => MapEntry(k as String, e),
//  )))
//      .toList();
}

class ProductCat {
  int id;
  String name;
  int parentCategoryId;
  ProductImage image;
  List<ChildCategories> childCategories;

  ProductCat({
    this.id,
    this.name,
    this.parentCategoryId,
    this.image,
    this.childCategories,
  });

  factory ProductCat.fromJson(Map<String, dynamic> json) {
    var list = json['childCategories'] as List;
    print(list.runtimeType);

    List<ChildCategories> childCatList =
        list.map((i) => ChildCategories.fromJson(i)).toList();

    return new ProductCat(
      id: json['id'],
      name: json['name'],
      childCategories: childCatList,
      image: ProductImage.fromJson(json['image']),
    );
  }
}

class ProductImage {
  String imageUrl;

  ProductImage({
    this.imageUrl,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      imageUrl: json['imageUrl'],
    );
  }
}

class ChildCategories {
  int id;
  String name;
  int parentCategoryId;
  ChildImage image;

  ChildCategories({
    this.id,
    this.name,
    this.parentCategoryId,
    this.image,
  });

  factory ChildCategories.fromJson(Map<String, dynamic> json) {
    return new ChildCategories(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      image: ChildImage.fromJson(json['image']),
    );
  }
}

class ChildImage {
  String imageUrl;

  ChildImage({
    this.imageUrl,
  });

  factory ChildImage.fromJson(Map<String, dynamic> json) {
    return ChildImage(
      imageUrl: json['imageUrl'],
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
  List<Try> trylist = [
    Try(name: 'q'),
    Try(name: 'w'),
  ];

  @override
  void initState() {
    super.initState();
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
            child: FutureBuilder<ProductCat>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
//              return ListView(
//                children: snapshot.data.childCategories.map((model) {
//                  return Text(model.image.imageUrl);
//                }).toList(),
//              );
              return Text(snapshot.data.name);
            } else {
              return CircularProgressIndicator();
            }
          },
        )),
      ),
    );
  }
}

class Try {
  String name;

  Try({this.name});
}
