import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sai_collections/components/component.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:sai_collections/user_managment.dart';
import 'package:sai_collections/login/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String show = "Show";
  bool passwordVisible = true;
  bool progressIndicator = false;

  String userEmail, userPassword, userName;

  // var _auth = FirebaseAuth.instance;
  Component component = new Component();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(                  
                  height: 50.0,
                ),
                Text(
                  "Create Account",
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
                          padding:
                              const EdgeInsets.only(right: 30.0, left: 20.0),
                          child: component.textFormFieldEmail(context)),
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
                        Icons.person,
                        color: Theme.of(context).accentColor,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                        child: component.textFormFieldName(context),
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
                        child: component.textFormFieldPassword(context, passwordVisible),
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
                  height: 30.0,
                ),
                Text(
                  "Tearms & Conditions",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 18.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  child: Container(
                    height: 20.0,
                    width: 150.0,
                    child: Center(
                      child: progressIndicator
                          ? component.spinKitThreeBounce(context, 
                              Theme.of(context).primaryColor)
                          : Text(
                              "CREATE ACCOUNT",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.0),
                            ),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () async {
                    final pref = await SharedPreferences.getInstance();
                    if (!(await component.checkInternetConnection(context))) {
                      component.showInSnackBar(context, 
                          _scaffoldKey, "Please Connect To The Internet");
                    } else {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        userEmail = component.userEmail;
                        userPassword = component.userPassword;
                        userName = component.userName;
                        progressIndicator = true;
                        setState(() {});
                        pref.setString('name', userName);
                        pref.setString('email', userEmail);
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: userEmail, password: userPassword)
                            .then((FirebaseUser signedInUser) {
                              pref.setBool('status', true);
                              UserManagment()
                                  .storeNewUser(signedInUser, context);
                            })
                            .timeout((new Duration(seconds: 15)))
                            .catchError((e) {
                              print(e);
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
                  height: 60.0,
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
                    "Already Have Account?",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20.0),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
