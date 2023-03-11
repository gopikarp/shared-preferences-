import 'package:flutter/material.dart';
import 'package:screen_navigation/splash.dart';

const SAVE_KEY = "userlogeedin"; //1_SHARED PRE-GLOBAL

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(), //STARTED  1
    ),
  );
}
