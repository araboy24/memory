import 'package:flutter/material.dart';
// import 'package:ez_hax/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration:
        BoxDecoration(
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
        child: Center(
          child: SpinKitRipple(
            // color: Colors.orange[200],
            color: Colors.blueGrey[200],
            size: 100.0,
          ),
        ),

      ),

    );
  }
}
