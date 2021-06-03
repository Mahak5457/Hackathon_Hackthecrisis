import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 10.0,),
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/avatar.jpg'),
                radius: 30.0,
              ),
              SizedBox(height: 5.0,),
              Text(
                'Name',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}