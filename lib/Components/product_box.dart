import 'package:covid_trendz/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      // height: 200.0,
      elevation: 5.0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/product.jpeg',
                width: 150.0,
              ),
            ),
          ),
          Container(
            width: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Price')
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text('120'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
