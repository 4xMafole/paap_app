import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaaP"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: ,
      ),
    );
  }
}

class categoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  categoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl, width: 120, height: 60)
        ],
      ),
    );
  }
}

