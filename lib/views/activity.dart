import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  // var now = new DateTime.now();
  // var formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = new DateFormat.yMMMd('en_US').format(new DateTime.now()).split(',')[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title: Text('Activity',
        style: TextStyle(
            color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 30,
          ),
        ),
      ),
      body:
      // SingleChildScrollView(
      //   child:
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xff111440),
                const Color(0xff2D2E4A),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(formattedDate,
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                  color: Color(0xff02042E),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bhaven Patel',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                    Text(' reacted to your update.',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Color(0xff02042E),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bhaven Patel',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(' followed you.',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text('Follow Back',
                            style: TextStyle(
                                color: Color(0xff02042E),
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xff111440),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text('View Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      // ),
    );
  }
}
