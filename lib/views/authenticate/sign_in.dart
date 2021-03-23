import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
import 'package:memory/shared/constants.dart';
import 'package:memory/shared/loading.dart';
import 'package:memory/views/authenticate/forgotPassword.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';

import '../../home.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();


  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    // return (user == null) ? loading ?
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title: Text('Memory',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30
        ),
        ),
      ),
      body: Container(
        // #111440
        color: Color(0xff111440),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          // child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text('Log In',
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
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: authButtonDecorationLightBlue,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/googleIconWhite.png',
                                height: 30, width: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('Continue with Google',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: authButtonDecorationLightBlue,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/appleLogo.png',
                                height: 30, width: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('Continue with Apple',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                    children: [
                      Expanded(
                          child: Divider(color: Colors.white,)
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),

                      Expanded(
                          child: Divider(color: Colors.white,)
                      ),
                    ],
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
                SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot your password? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => ForgotPassword(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Tap Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          .signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email address.';
                          loading = false;
                        });
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
                SizedBox(height: 24,),
              ],
            ),
          // ),
        ),
      ),
    ); // : Home();
  }
}
