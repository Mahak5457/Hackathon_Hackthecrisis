import 'package:covid_trendz/Components/product_tile.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covid Trendz'),
        backgroundColor: Color(0XFF6C63FF),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index){
          return ProductTile();
        },
      ) ,
    );
  }
}
