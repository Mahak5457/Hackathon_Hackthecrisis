import 'package:covid_trendz/Components/text_field.dart';
import 'package:covid_trendz/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_trendz/Components/user.dart';

UserData userData = UserData();
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loggedIn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loggedIn = userData.authState();
    // userData.getData();
  }

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
                'Welcome Back !',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Login to continue',
                style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'images/LoginPic.svg',
                  width: 200.0,
                ),
              ),
              textField(title: 'Email',
                onChanged: (value){
                  userData.email = value;
                },),
              SizedBox(
                height: 10.0,
              ),
              textField(title: 'Password',
              onChanged: (value){
                userData.password = value;
              },),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async{
                      var result = await userData.Login();
                      print('done');
                      Navigator.pushNamed(context, '/feed');

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10.0),
                      backgroundColor: MaterialStateProperty.all(Color(0XFF6C63FF)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.1,
                            0.5,
                            0.9
                          ],
                          colors: [
                            Colors.grey[200],
                            Colors.white,
                            Colors.grey[200]
                          ])),
                  child: TextButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, '/sign_in');
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Color(0XFF6C63FF),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
