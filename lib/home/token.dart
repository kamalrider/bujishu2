import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TokenPage());

class TokenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TokenPageHome2(),
    );
  }
}

class TokenPageHome2 extends StatefulWidget {

   String tokens;
   TokenPageHome2({Key key, this.tokens}) : super(key: key);

  @override
  _TokenPagestate createState() => _TokenPagestate();
}

class _TokenPagestate extends State<TokenPageHome2>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

           Text('haha'),
           Container(
             height: 100,
             width: MediaQuery.of(context).size.width*0.8,
             decoration:
             BoxDecoration(border: Border.all(color: Colors.grey),
               borderRadius: BorderRadius.circular(5),
             ),
             child: TextFormField(
               controller: TextEditingController()..text = widget.tokens,
               textAlign: TextAlign.center,
               onChanged: (text) => {},
               cursorColor: Colors.black,
               decoration: InputDecoration(
                 border: InputBorder.none,
                 focusedBorder: InputBorder.none,
                 enabledBorder: InputBorder.none,
                 errorBorder: InputBorder.none,
                 disabledBorder: InputBorder.none,
//                                      contentPadding: EdgeInsets.only(
//                                          left: 15,
//                                          bottom: 11,
//                                          top: 11,
//                                          right: 15),
               ),
             ),
           ),
         ],
       ),
     ),
      ),
    );

  }

}



