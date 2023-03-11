import 'package:flutter/material.dart';
import 'package:screen_navigation/home.dart';
import 'package:screen_navigation/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _email = TextEditingController();

  TextEditingController _pass = TextEditingController();

  bool _isdatamatched = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "value is empty";
                  } else {
                    return null;
                  }
                },
                controller: _email,
                decoration: const InputDecoration(
                  label: Text("email"),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "value is empty";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                controller: _pass,
                decoration: const InputDecoration(
                  label: Text("password"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isdatamatched,
                    child: const Text(
                      "user name and pass dosn't match",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        checklogin(context);
                      } else {
                        print("data is emptyy");
                      }
                    },
                    child: const Text("login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//3_SHARED PRE
  Future<void> checklogin(BuildContext context) async {
    final email_ = _email.text;
    final pass_ = _pass.text;
    if (pass_ == email_) {
    } else {
      final errormsg = "user name and pass dosn't match";

//showSnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errormsg),
        ),
      );

//showDialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Error"),
          content: Text(errormsg),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("close"),
            ),
          ],
        ),
      );
//error with login button
      setState(
        () {
          _isdatamatched = false;
        },
      );
    }
    if (pass_ == email_) {
      print("matched");

//3.1_SHARED PRE
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(SAVE_KEY, true); //true- aanenkill to home

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => home(),
        ),
      ); //no change
    } else {
      print("not --- matched");
    }
  }
}
