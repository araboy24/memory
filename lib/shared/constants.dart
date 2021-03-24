import 'package:flutter/material.dart';

var authButtonDecoration = BoxDecoration(
    color: Color(0xffd05E01),
  borderRadius: BorderRadius.circular(36)
);

var authButtonDecorationLightBlue = BoxDecoration(
    color: Color(0xff727CE5),
    borderRadius: BorderRadius.circular(36)
);

var lightTextFormDecoration = InputDecoration(
  fillColor: Color(0xff9092BF),
  filled: true,
  hintStyle: TextStyle(color: Colors.white),
  contentPadding: EdgeInsets.only(left : 24.0),
  enabledBorder: OutlineInputBorder(
    //borderSide: BorderSide(color: Colors.white, width: 2),
    borderRadius: BorderRadius.circular(36),
  ),
  focusedBorder: OutlineInputBorder(
    // borderSide: BorderSide(color: Colors.lightBlue, width: 2),
    borderRadius: BorderRadius.circular(36),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(36),
  )
);

var orangeBg =  BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xffFFA00E),
      const Color(0xffFE7F1C),
    ],
  ),
);


var bigWhiteText = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.w700
);