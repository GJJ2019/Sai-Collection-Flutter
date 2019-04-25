import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sai_collections/home.dart';
import 'package:sai_collections/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {  
  @override
  void initState() {    
    super.initState();
    sample();
  }

  void sample() async {
    final pref = await SharedPreferences.getInstance();
    bool t = pref.getBool('status');
    if (t == null) {
      t = false;
    }
    new Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => t ? Home() : Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlutterLogo(
                size: 70.0,
              ),
            ),
            Text(
              "Flutter Awesone",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.0,
            ),
            SpinKitThreeBounce(
              color: Theme.of(context).accentColor,
              size: 30.0,
              duration: Duration(milliseconds: 800),
            ),
          ],
        ),
      ),
    );
  }
}
