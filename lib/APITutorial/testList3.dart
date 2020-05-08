import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<DetailCategory> fetchAlbum() async {
  final response =
  await http.get('https://demo3.bujishu.com/api/categories/1?products=true');
//      .timeout(Duration(seconds: 180),onTimeout: (){return null;});

//  await http.get('https://demo3.bujishu.com/api/categories/7/childs');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return DetailCategory.fromJson(json.decode(response.body));
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

class DetailCategory {
  int id;
  String name;
  int parentCategoryId;
  DetailImages images;
  List<DetailProduct> detailProduct;

  DetailCategory({
    this.id,
    this.name,
    this.parentCategoryId,
    this.images,
    this.detailProduct,
  });

  factory DetailCategory.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    print(list.runtimeType);
    List<DetailProduct> detailCatList =
        list.map((i) => DetailProduct.fromJson(i)).toList();

    return DetailCategory(
      id: json['id'],
      name: json['name'],
      parentCategoryId: json['parentCategoryId'],
      images: DetailImages.fromJson(json['image']),
      detailProduct: detailCatList,
    );
  }
}

class DetailImages{
  String imageUrl;

  DetailImages({this.imageUrl});
  factory DetailImages.fromJson(Map<String, dynamic> json) {
    return DetailImages(
      imageUrl: json['imageUrl'],
    );
  }

}

class DetailProduct {
  int id;
  String code;
  String name;
  String details;
  String description;
  String quality;
  double rating;
  List<Images> images;
  List<SoldBy> soldBy;

  DetailProduct(
      {this.id,
      this.code,
      this.name,
      this.details,
      this.description,
      this.quality,
      this.rating,
      this.images,
      this.soldBy});

  factory DetailProduct.fromJson(Map<String, dynamic> json) {
    var list1 = json['images'] as List;
    var list2 = json['soldBy'] as List;

    List<Images> imageList = list1.map((i) => Images.fromJson(i)).toList();
    List<SoldBy> soldByList = list2.map((j) => SoldBy.fromJson(j)).toList();
    return DetailProduct(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      details: json['details'],
      description: json['description'],
      quality: json['quality'],
      rating: json['rating'],
      images: imageList,
      soldBy: soldByList,
    );
  }
}

class Images {
  String imageUrl;

  Images({this.imageUrl});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      imageUrl: json['imageUrl'],
    );
  }
}

class SoldBy {
  int id;
  int panelAccountId;
  String description;
  String material;
  String consistency;
  String package;
  int price;
  int memberPrice;
  int deliveryFee;
  int installationFee;
  double rating;

  SoldBy(
      {this.id,
      this.panelAccountId,
      this.description,
      this.material,
      this.consistency,
      this.package,
      this.price,
      this.memberPrice,
      this.deliveryFee,
      this.installationFee,
      this.rating});

  factory SoldBy.fromJson(Map<String, dynamic> json) {
    return SoldBy(
        id: json['id'],
        panelAccountId: json['panelAccountId'],
        description: json['description'],
        material: json['material'],
        consistency: json['consistency'],
        package: json['package'],
        price: json['price'],
        memberPrice: json['memberPrice'],
        deliveryFee: json['deliveryFee'],
        installationFee: json['installationFee'],
        rating: json['rating']);
  }
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example 1'),
        ),
        body: Center(
            child: FutureBuilder<DetailCategory>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
//                  return ListView(
//                    children: snapshot.data.detailProduct.map((model) {
//                      return Text(model.id.toString());
//                    }).toList(),
//                  );
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
