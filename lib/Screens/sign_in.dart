import 'package:covid_trendz/Components/primary_button.dart';
import 'package:covid_trendz/Components/text_field.dart';
import 'package:covid_trendz/Components/user.dart';
import 'package:covid_trendz/Constants/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserData userData = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covid Trendz'),
        backgroundColor: Color(0XFF6C63FF),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New User !!',
              style: kloginTitle,
            ),
            Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
            SizedBox(height: 20.0),
            textField(
              title: "Full Name",
              onChanged: (value) {
                userData.name = value;
              },
            ),
            SizedBox(height: 20.0),
            textField(
              title: "Email",
              onChanged: (value) {
                userData.email = value;
              },
            ),
            SizedBox(height: 20.0),
            textField(
              title: "Password",
              onChanged: (value) {
                userData.password = value;
              },
            ),
            SizedBox(height: 20.0),
            textField(
              title: "Preferred job",
              onChanged: (value) {
                userData.job = value;
              },
            ),
            SizedBox(height: 20.0),
            textField(
              title: "Contact No.",
              onChanged: (value) {
                userData.phoneNo = value;
              },
            ),
            PrimaryButton(
              onPressed: () async{
                var result = await userData.Registration();
                await userData.storeData();
                Navigator.pushNamed(context, '/feed');
                print('done');
              },
              title: 'Sign In',
              color: Color(0XFF6C63FF),
            )
          ],
        ),
      ),
    );
  }
}
