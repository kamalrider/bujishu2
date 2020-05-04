import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIList extends StatelessWidget{

  final String apiUrl = "https://demo3.bujishu.com/api/categories";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);
    return json.decode(result.body)['results'];

  }

//  String _name(dynamic user){
//    return user['name']['title'] + " " + user['name']['first'] + " " +  user['name']['last'];
//
//  }
//
//  String _location(dynamic user){
//    return user['location']['country'];
//  }
//
//  String _age(Map<dynamic, dynamic> user){
//    return "Age: " + user['dob']['age'].toString();
//  }

  String name(dynamic product){
    return product['name'];
  }

  String created_at(dynamic product){
    return product['created_at'];
  }

  String updated_at(dynamic product){
    return product['updated_at'];
  }

    String id(Map<dynamic, dynamic> product){
    return product['id'].toString();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print(id(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(snapshot.data[index]['picture']['large'])),
                              title: Text(name(snapshot.data[index])),
//                              subtitle: Text(created_at(snapshot.data[index])),
//                              trailing: Text(updated_at(snapshot.data[index])),
                            )
                          ],
                        ),
                      );
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      ),
    );
  }

}