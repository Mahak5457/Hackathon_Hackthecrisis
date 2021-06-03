import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:new_app/config/palette.dart';
import 'Sign_upbar.dart';
import 'decoration_function.dart';
import 'title.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key, @required this.onRegisterClicked}) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
        child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Expanded(
                  flex: 3, // this expanded will take 3/7 of the screen size
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: LoginTitle(
                        title: 'Welcome\nBack',
                      )),
                ),
                Expanded(
                  flex: 4, // this expanded wil take 4/7 of the screen size
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: EmailTextFormField(
                            decoration:
                                signInInputDecoration(hintText: 'Email')),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: PasswordTextFormField(
                          decoration:
                              signInInputDecoration(hintText: 'Password'),
                        ),
                      ),
                      SignInBar(
                        isLoading: isSubmitting,
                        label: 'Sign in',
                        onPressed: () {
                          context.signInWithEmailAndPassword();
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            onRegisterClicked?.call();
                            // if (onRegisterClicked != null) {
                            //   onRegisterClicked();
                            // }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Palette.darkBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
