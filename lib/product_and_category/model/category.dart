import 'package:Bujishu/product_and_category/model/product.dart';

class Category {
  int id;
  String name;
  String image;
  List<Prodduct> product;
  int APIid;

  Category({this.id, this.name, this.image, this.product, this.APIid});
}
