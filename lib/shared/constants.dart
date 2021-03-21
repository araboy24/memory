import 'package:flutter/material.dart';

var authButtonDecoration = BoxDecoration(
  color: Colors.black38,
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

  enabledBorder: OutlineInputBorder(
    //borderSide: BorderSide(color: Colors.white, width: 2),
    borderRadius: BorderRadius.circular(36),
  ),
  focusedBorder: OutlineInputBorder(
    // borderSide: BorderSide(color: Colors.lightBlue, width: 2),
    borderRadius: BorderRadius.circular(36),
  ),
);