import 'package:covid_trendz/Components/user.dart';
import 'package:covid_trendz/Constants/constants.dart';
import 'package:flutter/material.dart';
import '../Components/user_box.dart';
import '../Components/product_box.dart';
import '../Screens/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 10.0,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.jpg'),
                  radius: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: [
                    Text(
                      userData.name,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userData.job,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Text('Team members', style: ktextstyle),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 100.0,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return User();
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10.0),
            child: Text(
              'Products/Services',
              style: ktextstyle,
            ),
          ),
          Container(
            height: 170.0,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return ProductBox();
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            'Blogs for you !!',
            style: ktextstyle,
          )
        ],
      ),
    );
  }
}
