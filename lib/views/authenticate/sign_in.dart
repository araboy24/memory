import 'package:flutter/material.dart';
import 'package:memory/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title: Text('Memory',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30
        ),),
      ),
      body: Container(
        // #111440
        color: Color(0xff111440),
        width: MediaQuery.of(context).size.width,
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/googleIcon.png',
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
                children: <Widget>[
                  Expanded(
                      child: Divider(color: Colors.white,)
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR",
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
                decoration: lightTextFormDecoration.copyWith(hintText: '  Email'),
                onTap: () {

                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: lightTextFormDecoration.copyWith(hintText: '  Password'),
                onTap: () {

                },
              ),
            ),
            Spacer(),
            Container(
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
            SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}
