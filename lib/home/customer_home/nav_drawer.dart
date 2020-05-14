import 'package:bujishu2/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  SharedPreferences sharedPreferences;

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
              onTap: () => {Navigator.of(context).pop()},
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
              onTap: () => {Navigator.of(context).pop()},
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
              onTap: () => {Navigator.of(context).pop()},
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
            child:
//            Text('Lightings'),
                ListTile(
              //leading: Icon(Icons.exit_to_app),
              title: Text('Lightings'),
              onTap: () => {Navigator.of(context).pop()},
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
          MaterialButton(
            height: 45,
            color: Color(0xffD4AF37),
//            padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
            child: Text('Logout'),
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginApp()),
                  (Route<dynamic> route) => false);
            },
//            Text('Auxiliary Prosperity Items'),
          ),
        ],
      ),
    );
  }
}
