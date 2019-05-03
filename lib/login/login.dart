import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:sai_collections/component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sai_collections/home.dart';
import 'package:sai_collections/login/register.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String show = "Show";
  bool passwordVisible = true;
  bool progressIndicator = false;

  String userEmail, userPassword;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Component component = new Component();
    Future<FirebaseUser> signInAccount(String email, String password) async {
      FirebaseUser user;

      try {
        user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        return user;
      } on PlatformException catch (e) {
        // print('failed');
        // print(e);
        return null;
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                FlutterLogo(
                  size: 60.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 30.0),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Icon(
                        Icons.email,
                        color: Theme.of(context).accentColor,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                        child: component.textFormFieldEmail(context),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Icon(
                        Icons.lock,
                        color: Theme.of(context).accentColor,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: component.textFormFieldPassword(context, 
                            passwordVisible),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, left: 10.0),
                      child: GestureDetector(
                        child: Text(
                          show,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                          if (show == "Show") {
                            show = "Hide";
                            passwordVisible = false;
                            setState(() {});
                          } else {
                            show = "Show";
                            passwordVisible = true;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  child: Container(
                    height: 20.0,
                    width: 120.0,
                    child: Center(
                      child: progressIndicator
                          ? component.spinKitThreeBounce(context, 
                              Theme.of(context).primaryColor)
                          : Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.0),
                            ),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () async {
                    // userEmail = component.userEmail;
                    if (!(await component.checkInternetConnection(context))) {
                      component.showInSnackBar(context, _scaffoldKey,
                          "Please Connect To The Internet");
                    } else {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        progressIndicator = true;
                        userEmail = component.userEmail;
                        userPassword = component.userPassword;
                        setState(() {});
                        final pref = await SharedPreferences.getInstance();
                        signInAccount(userEmail, userPassword)
                            .then((FirebaseUser user) {
                          if (user != null) {
                            pref.setBool('status', true);
                            pref.setString('email', userEmail);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            progressIndicator = false;
                            setState(() {});
                            component.showInSnackBar(context, _scaffoldKey,
                                "Email Or Password Is Incorrect");
                            print('failed');
                          }
                        });
                      }
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  splashColor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 25.0),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    color: Theme.of(context).accentColor,
                    height: 2.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Don't Have Account?",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20.0),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
