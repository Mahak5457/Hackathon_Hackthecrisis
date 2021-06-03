import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:new_app/business/home.dart';
import 'package:new_app/business/register.dart';
import 'backgroundpainter.dart';
import 'signin.dart';
import 'package:new_app/config/palette.dart';

class AuthScreen extends StatefulWidget {
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => AuthScreen(),
      );

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValueNotifier<bool> showSigninPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LitAuth.custom(
            errorNotification: const NotificationConfig(
              backgroundColor: Palette.darkBlue,
              icon: Icon(
                Icons.error_outline,
                color: Palette.creamWhite,
                size: 32,
              ),
            ),
            successNotification: const NotificationConfig(
              backgroundColor: Palette.darkBlue,
              icon: Icon(
                Icons.error_outline,
                color: Palette.creamWhite,
                size: 32,
              ),
            ),
            onAuthSuccess: () {
              Navigator.of(context).pushReplacement(HomeScreen.route);
            },
            child: Stack(
              children: [
                SizedBox.expand(
                  child: CustomPaint(
                    painter: BackgroundPainter(
                      animation: _controller.view,
                    ),
                  ),
                ),
                Center(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: ValueListenableBuilder<bool>(
                      valueListenable: showSigninPage,
                      builder: (context, value, child) {
                        return PageTransitionSwitcher(
                            reverse: !value,
                            duration: Duration(milliseconds: 800),
                            transitionBuilder:
                                (child, animation, secondaryAnimation) {
                              return SharedAxisTransition(
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                fillColor: Colors.transparent,
                                transitionType:
                                    SharedAxisTransitionType.vertical,
                                child: child,
                              );
                            },
                            child: value
                                ? SignIn(
                                    key: ValueKey('SignIn'),
                                    onRegisterClicked: () {
                                      context.resetSignInForm();
                                      showSigninPage.value = false;
                                      _controller.forward();
                                    },
                                  )
                                : Register(
                                    key: ValueKey('Register'),
                                    onSignInPressed: () {
                                      context.resetSignInForm();
                                      showSigninPage.value = true;
                                      _controller.reverse();
                                    },
                                  ));
                      }),
                ))
              ],
            )));
  }
}
