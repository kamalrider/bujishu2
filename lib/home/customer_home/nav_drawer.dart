import 'package:Bujishu/login.dart';
import 'package:Bujishu/product_and_category/model/category.dart';
import 'package:Bujishu/product_and_category/model/product.dart';
import 'package:Bujishu/product_and_category/model/productlist.dart';
import 'package:Bujishu/product_and_category/view/product_by_categoryqwer2.dart';
import 'package:Bujishu/product_and_category/view/product_detail.dart';
import 'package:flutter/material.dart';


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
}

class ProductImage {
  String imageUrl;

  ProductImage({
    this.imageUrl,
  });
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
}

class ChildImage {
  String imageUrl;

  ChildImage({this.imageUrl});
}

class NavDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(
          top: 1,
        ),
        children: <Widget>[
          Container(
              width: 80,
              height: 150,
              color: Colors.black,
              padding: EdgeInsets.only(bottom: 10),
              child: DrawerHeader(
                child: Image.asset('assets/images/bujishu_logo.png'),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  //fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/cover.jpg',
                  ),
                )),
              )),
          Container(
            width: 30,
            height: 50,
//            padding: EdgeInsets.only(top: 15, bottom: 5, left: 10),
            padding: EdgeInsets.only(top: 5, bottom: 5),
            //color: Color(0xfffbcc34),
            color: Color(0xffD4AF37),
            //color: Colors.red,
            child:
//            Text(
//              'Shop By Category',
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 18
//                ),
//            ),
                ListTile(
              //leading: Icon(Icons.input),
              title: Text(
                'Shop By Category',
              ),
              onTap: () => {},
            ),
          ),
          Container(
            height: 45,
            width: 50,
//              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
            //padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Color(0xffD4AF37),
            child:
//              Text('Bedsheets & Mattresses')
                ListTile(
              //leading: Icon(Icons.verified_user),
              title: Text('Bedsheets & Mattresses'),
                  onTap: () {
                    var childRoute = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ProductCategoryHomeAPI(
                        valueId: 1,
                        valueApi: 1,
                      ),
                    );

                    Navigator.push(context, childRoute);
                  },
            ),
          ),
          Container(
            width: 80,
            height: 45,
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            //padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Color(0xffD4AF37),
            child:
//            Text('Cupboards'),
                ListTile(
              //leading: Icon(Icons.settings),
              title: Text('Cupboards'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Tables & Chairs'),
                ListTile(
              //leading: Icon(Icons.border_color),
              title: Text('Tables & Chairs'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Carpets'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Carpets'),
                  onTap: () {
                    var productRoute = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ProductDetailHome(
                        value: 4,
                        pageKey: 0,
                      ),
                    );

                    Navigator.push(context, productRoute);
                  },
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//              padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//              Text('Curtains')
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Curtains'),
                  onTap: () {
                    var productRoute = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ProductDetailHome(
                        value: 5,
                        pageKey: 0,
                      ),
                    );

                    Navigator.push(context, productRoute);
                  },
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Tiles'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Tiles'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),

//            Text('Lightings'),

                  child: ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Lightings'),
              onTap: () {
                var childRoute = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new ProductCategoryHomeAPI(
                    valueId: 3,
                    valueApi: 7,
                  ),
                );

                Navigator.push(context, childRoute);
              },
            ),

          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Wallpapers'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Wallpapers'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Roofs'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Roofs'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Doors'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Doors'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Windows'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Windows'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
          Container(
            width: 80,
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child:
//            Text('Auxiliary Prosperity Items'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Auxiliary Prosperity Items'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ),
        ],
      ),
    );
  }
}
