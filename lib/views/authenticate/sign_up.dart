import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
import 'package:memory/shared/constants.dart';
import 'package:memory/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';

import '../../home.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  String email = '';
  String password = '';
  String passwordConfirm = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    // return (user == null) ?
    return loading ? Loading() :
    Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title: Text('Memory',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
          ),
        ),
      ),
      body: Container(
        // #111440
        color: Color(0xff111440),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text('Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text('By continuing, you are agreeing to our Privacy Policy and User Agreement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: lightTextFormDecoration.copyWith(hintText: 'Email'),
                  validator: (val) =>
                  //TODO: Check for valid email with RegExp
                  val.isEmpty ? 'Enter a valid email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: lightTextFormDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6
                      ? 'Enter a Password 6+ Characters Long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: lightTextFormDecoration.copyWith(hintText: 'Confirm Password'),
                  validator: (val) =>
                  val != password ? "Passwords Don't Match" : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      passwordConfirm = val;
                    });
                  },
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth
                        .registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please supply a valid email address.';
                        loading = false;
                      });
                    } else{
                      print('Log in should be successful');
                    }
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(36)
                  ),
                  child: Text('Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    ); //: Home();
  }
}
//TODO CANT NAVIGATE FROM WELCOME BECASUE WRAPPER GOES AWAY SO IT WON"T SWITCH TO HOME