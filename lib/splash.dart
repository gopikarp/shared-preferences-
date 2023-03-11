import 'dart:async';
import 'package:flutter/material.dart';
import 'package:screen_navigation/home.dart';
import 'package:screen_navigation/login.dart';
import 'package:screen_navigation/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    checkUserLogged(); //2
    // gotoLogin();

    super.initState();
    // Timer(
    //   Duration(seconds: 1),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (ctx) => login(),
    //     ),
    //   ),
    // );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => login(),
      ),
    );
  }

  //2_SHARED PRE
//3
  Future<void> checkUserLogged() async {
    final pref = await SharedPreferences.getInstance();
    final userLogged = pref.getBool(SAVE_KEY);
    if (userLogged == null || userLogged == false) {
      gotoLogin(); //3.1 TO LOGIN
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => home(), //3.2 OR TO HOME
        ),
      );
    }
  }
}
