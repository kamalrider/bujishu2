import 'package:Bujishu/product_and_category/model/productlist.dart';
import 'package:Bujishu/product_and_category/view/product_by_category.dart';

import 'package:Bujishu/product_and_category/view/product_by_categoryt.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          /*
          child: Column(
            children: ProductList.categoryList.map((category){

              return Container(
                child: RaisedButton(
                  child: Text(category.name),
                  onPressed: (){
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProductCategoryHome(value: category);
                        }
                    );
                    Navigator.of(context).push(route);
                  },
                ),
              );

            }).toList(),
          ), */

          child: Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: ProductList.categoryList.length,
                itemBuilder: (context, index){
                  final item = ProductList.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(item.image, fit: BoxFit.cover,),
                          ),
                          Text(item.name),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
