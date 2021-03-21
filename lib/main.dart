import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
import 'package:memory/shared/loading.dart';
import 'package:memory/views/authenticate/sign_in.dart';
import 'package:memory/views/authenticate/welcome.dart';
import 'package:memory/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<User>(
          create: (context) => User(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
    value: AuthService().user,
    child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Wrapper()
      ),
    );
  }
}
