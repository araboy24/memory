import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
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
        backgroundColor: Colors.black,
        title: Text('DATUM', style: TextStyle(
          fontSize: 35,
          color: Colors.blue[200],
        ),
        ),
        actions: [
          FlatButton.icon(onPressed: () async {
            await _auth.signOut();
          },
            icon: Icon(
              Icons.logout,
              color: Colors.blue[200],
            ),
            label: Text(''),
          ),
        ],
      ),
      body: Container(
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

          ],
        ),
      ),
    );
  }
}
