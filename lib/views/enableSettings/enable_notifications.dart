import 'package:flutter/material.dart';
import 'package:memory/shared/constants.dart';

class EnableNotifications extends StatefulWidget {
  @override
  _EnableNotificationsState createState() => _EnableNotificationsState();
}

class _EnableNotificationsState extends State<EnableNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: orangeBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome aboard!',
              style: bigWhiteText),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * .85,
                child: Text('Memory keeps you connected to yourself and your close friends.',
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ),
            ),
            //TODO ADD THUMBS UP
            Container(
              alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/thumbsUp.png'),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .75,
              child: Text(
                'Turn on notifications to be reminded to log activity and know when your friends'
                    'post new updates.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 14,),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: Color(0xffD05C01),
              ),
              width: MediaQuery.of(context).size.width * .85,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(vertical: 16, ),
              child: Text('Enable notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
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
