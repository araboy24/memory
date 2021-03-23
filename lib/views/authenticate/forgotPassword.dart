import 'package:flutter/material.dart';
import 'package:memory/shared/constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title:  Text('Password Retrieval',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25
        ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff111440),
        ),
        child: Column(
          children: [
            Text('Please enter your email:'),
            TextFormField(

            )
          ],
        ),
      ),
    );
  }
}
