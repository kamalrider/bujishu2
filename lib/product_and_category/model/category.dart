import 'package:bujishu2/product_and_category/model/product.dart';

class Category {
  int id;
  String name;
  String image;
  List<Prodduct> product;

  Category({this.id, this.name, this.image, this.product});
}
