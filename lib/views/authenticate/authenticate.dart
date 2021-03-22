// import 'package:memory/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:memory/views/authenticate/sign_in.dart';
// import 'package:memory/views/authenticate/sign_up.dart';
//
// class Authenticate extends StatefulWidget {
//   final bool isSignIn;
//   Authenticate({this.isSignIn});
//
//   @override
//   _AuthenticateState createState() => _AuthenticateState();
// }
//
// class _AuthenticateState extends State<Authenticate> {
//
//   bool showSignIn;
//   void toggleView() {
//     setState(() {
//       showSignIn = !showSignIn;
//     });
//   }
//
//   @override
//   void initState() {
//     showSignIn = widget.isSignIn;
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     // return Container();
//     if(showSignIn){
//       return SignIn(toggleView: toggleView);
//     } else {
//       return SignUp(toggleView: toggleView);
//     }
//   }
// }
