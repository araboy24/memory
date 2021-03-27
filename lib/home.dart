import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
import 'package:memory/views/activity.dart';
import 'package:memory/views/profile.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title: Text('Memory', style: TextStyle(
          fontSize: 35,
          color: Colors.white,//indigo[400],
        ),
        ),
        actions: [
          FlatButton.icon(onPressed: () async {
            await _auth.signOut();
          },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text(''),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // const Color(0xffFFA00E),
              // const Color(0xffFE7F1C),
              const Color(0xff111440),
              const Color(0xff2D2E4A),
            ],
          ),
        ),
        child: Column(
          children: [
            ElevatedButton(onPressed: () async { await _auth.signOut();} , child: Text('SignOut')),
            GestureDetector(
              onTap: () async {
                setState(() async {
                  await _auth.signOut();
                });

              },
              child: Container(
                color: Colors.red,
                child: Text(
                  'Home'
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Activity(),
                    ));
              },
              child: Container(
                color: Colors.blueGrey,
                  padding: EdgeInsets.all(12),
                  child: Text('Go to Activity'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Profile(),
                    ));
              },
              child: Container(
                color: Colors.blueGrey,
                padding: EdgeInsets.all(12),
                child: Text('Go to Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
