import 'package:flutter/material.dart';
import 'package:memory/shared/constants.dart';

class EnableContacts extends StatefulWidget {
  @override
  _EnableContactsState createState() => _EnableContactsState();
}

class _EnableContactsState extends State<EnableContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA00E),
        elevation: 0,
      ),
      body: Container(
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
            Text('Choose your close friends',
              textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600
            ),
            ),
            SizedBox(height: 16),
            Text('Connect your contacts to find people already on Memory or'
                ' invite your friends to join.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              ),
            ),
            Image.asset('assets/images/handShake.png'),
            SizedBox(height: 12,),
            Text("Don't worry, we don't post anything without your permission"
                "and your data is held with bank-level encryption.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Color(0xffd05E01),
                  borderRadius: BorderRadius.circular(36)
              ),
              child: Text('Enable access to Contacts',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8,),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text('Skip',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
