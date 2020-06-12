// main.dart

import 'package:Bujishu/Tutorial/secondScreen.dart';
import 'package:flutter/material.dart';

import 'flutterScreen.dart';


void main() {
  runApp(HomeScene());
}

class HomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit))
              ],
            ),
            title: Text('Flutter Tabs Example'),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

