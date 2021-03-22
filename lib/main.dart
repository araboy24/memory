import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
import 'package:memory/shared/loading.dart';
import 'package:memory/views/authenticate/sign_in.dart';
import 'package:memory/views/authenticate/welcome.dart';
import 'package:memory/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';
import 'package:flutter/cupertino.dart';

import 'home.dart';

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
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: Colors.white,
        ),
        cursorColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Wrapper()
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
