import 'package:flutter/material.dart';
import 'package:screen_navigation/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home section"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            logout(context);
          },
          child: Text("to logout"),
        ),
      ),
    );
  }

  logout(BuildContext ctx) async {
    //4_SHARED PRE
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //;

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => splash(),
        ),
        (route) => false);
  }
}
