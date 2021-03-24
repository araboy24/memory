import 'package:flutter/material.dart';
import 'package:memory/shared/constants.dart';
import 'package:memory/shared/loading.dart';
import 'package:memory/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  bool loading = false;

  String email = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                child: Text('Please enter your email:',
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                //width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                    decoration: lightTextFormDecoration.copyWith(hintText: 'Email'),
                  validator: (val) =>
                  val.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                    await _auth.forgotPassword(email);
                    if (result == false) {
                      setState(() {
                        error =
                        'Please supply a valid email address.';
                        loading = false;
                      });
                    } else {
                      setState(() {
                        error =
                        'Check your email to update your password';
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
                      color: Color(0xff727CE5),
                      borderRadius: BorderRadius.circular(36)
                  ),
                  child: Text('Reset Password',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                child: Text(error,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
