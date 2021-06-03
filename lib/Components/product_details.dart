import 'package:covid_trendz/Constants/constants.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'images/product.jpeg',
              width: 150.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Product',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0
              ),),
              IconButton(
                onPressed: (){
                  setState(() {
                    liked = true;
                  });
                },
                icon : Icon(Icons.favorite,
                size: 40.0,
                color: liked? Colors.red:Colors.grey),
              )
            ],
          ),
          Text('Reviews',
          style: ktextstyle,),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('aniket@gmail.com',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 10.0,),
                Text('This is a very good product.',
                ),
              ],
            ),
          )

        ],
      ),

    );
  }
}
