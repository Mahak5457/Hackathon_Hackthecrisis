import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  textField({this.title, this.onChanged}) ;

  final String title;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: title,
          // hintText: 'Email',
          labelStyle: TextStyle(color: Colors.black26, fontSize: 20.0)),
    );
  }
}
