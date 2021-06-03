import 'package:covid_trendz/Components/product_details.dart';
import 'package:covid_trendz/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({Key key}) : super(key: key);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return ProductDetails();
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/product.jpeg',
                width: 150.0,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Product',
                    style: ktextstyle,
                  ),
                  subtitle: Text(
                    'Category',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 20.0,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
