import 'package:flutter/material.dart';

void main() => runApp(ImageNetwork());

class ImageNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Image.network(
          'https://bujishu.com/storage/uploads/images/products/ales-anti-mosq/ales-anti-mosq_1.jpg',
        ),
      ),
    );
  }
}