import 'package:flutter/material.dart';
import 'package:memory/shared/constants.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xffFFA00E),
              const Color(0xffFE7F1C),
              //  top    #FFB603 second: #FFA00E

              // bottom  #FE7F1C
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: 400,
                alignment: Alignment.center,
                child: Text('Welcome to Memory',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w700
                ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: Text('By continuing, you are agreeing to our '
                        'Privacy Policy and User Agreement.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: authButtonDecoration,
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: authButtonDecoration,
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: authButtonDecoration,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.mail,
                                color: Colors.white,
                                size: 30,),
                              ),
                            ),
                          ),

                        // ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text('Continue with Email',

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
                ],
              )
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
