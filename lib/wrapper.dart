import 'package:flutter/material.dart';
import 'package:memory/home.dart';
import 'package:memory/views/authenticate/welcome.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null){
      print('user == null');
      return Welcome();
    } else {
      print('user != null');
      return Home();
    }
  }
}
