import 'package:flutter/material.dart';

import 'package:memory/models/user.dart';

class ProfileInfoTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage('https://cdn2.iconfinder.com/data'
                    '/icons/social-flat-buttons-3/512/anonymous-512.png'),
                fit: BoxFit.fill
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16),
          child: Row(
            children: [
              Text('First Name: ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),

              Text('Eid',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
