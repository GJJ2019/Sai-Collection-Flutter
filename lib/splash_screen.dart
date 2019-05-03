import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sai_collections/component.dart';

import 'package:sai_collections/home.dart';
import 'package:sai_collections/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool internet;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Component component = new Component();
  @override
  void initState() {
    super.initState();
    sample();
  }

  void sample() async {
    internet = await component.checkInternetConnection(context);
    final pref = await SharedPreferences.getInstance();
    bool t = pref.getBool('status');
    if (t == null) {
      t = false;
    }

    if (!internet) {
      component.showInSnackBar(
          context, _scaffoldKey, "Check Your Internet Connection");
    }
    new Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => t ? Home() : Login(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
              component.spinKitThreeBounce(
                  context, Theme.of(context).accentColor)
            ],
          ),
        ));
  }
}
