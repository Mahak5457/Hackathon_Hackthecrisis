import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.title, this.color, this.onPressed});

  final String title;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10.0),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
