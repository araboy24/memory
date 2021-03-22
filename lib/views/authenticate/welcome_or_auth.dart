import 'package:flutter/material.dart';
import 'package:memory/views/authenticate/authenticate.dart';
import 'package:memory/views/authenticate/sign_in.dart';
import 'package:memory/views/authenticate/sign_up.dart';
import 'package:memory/views/authenticate/welcome.dart';

class WelcomeOrAuth extends StatefulWidget {
  // final bool isWelcome;
  // WelcomeOrAuth({this.isWelcome});
  @override
  _WelcomeOrAuthState createState() => _WelcomeOrAuthState();
}

class _WelcomeOrAuthState extends State<WelcomeOrAuth> {
  bool isWelcome = true;
  bool isSignIn = false;
  bool isSignUp = false;
  void toggleView(String s) {
    setState(() {
      if (s == 'signUp'){
        goToSignUp();
      } else if(s == 'signIn'){
        goToSignIn();
      } else {
        goToWelcome();
      }
      isWelcome = !isWelcome;
    });
  }

  void goToWelcome(){
    setState(() {
      isWelcome = true;
      isSignIn = false;
      isSignUp = false;
    });
  }

  void goToSignIn(){
    setState(() {
      isWelcome = false;
      isSignIn = true;
      isSignUp = false;
    });
  }

  void goToSignUp(){
    setState(() {
      isWelcome = false;
      isSignIn = false;
      isSignUp = true;
    });
  }

  @override
  void initState() {
    // isWelcome = widget.isWelcome;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(isSignUp){
      return SignUp(toggleView: toggleView);
    } else if(isSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Welcome(toggleView: toggleView);
    }
  }
}
