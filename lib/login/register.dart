import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sai_collections/component.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  Component component = new Component();
  // var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Future<FirebaseUser> createUser(email, password, displayName) async {
    //   final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
    //       email: email, password: password);

    //   // UserUpdateInfo info = new UserUpdateInfo();
    //   // info.displayName = displayName;
    //   // _auth.updateProfile(info);
    //   await user.reload();
    //   // user = _auth.getCurrentUser();

    //   Firestore.instance.collection('users').document().setData({
    //     'name': displayName,
    //     'uid': user.uid,
    //     'email': user.email,
    //     'isEmailVerified': user.isEmailVerified,
    //     'photoUrl': user.photoUrl,
    //     // }).then((value) {
    //     //   Navigator.pushReplacement(
    //     //       context, MaterialPageRoute(builder: (context) => Home()));
    //     // }).catchError((e) {
    //     //   print(e);
    //   });

    //   print(user.displayName);
    //   print(user.email);
    //   print(user.uid);

    //   return user;
    // }

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
                        padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).accentColor,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Email Can\'t Be Empty :(';
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) return 'Invalid Email :(';
                          },
                          onSaved: (text) {
                            userEmail = text.toString();
                            print(userEmail);
                          },
                        ),
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
                        Icons.person,
                        color: Theme.of(context).accentColor,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          cursorColor: Theme.of(context).accentColor,
                          validator: (value) {
                            if (value.isEmpty) return 'Name Can\'t Be Empty';
                            if (value.length < 6)
                              return 'Your Name Is To Short';
                          },
                          onSaved: (value) {
                            userName = value;
                            print(value);
                          },
                        ),
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
                        child: TextFormField(
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          obscureText: passwordVisible,
                          cursorColor: Theme.of(context).accentColor,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Password Can\'t Be Empty';
                            if (value.length < 4)
                              return 'Your Password Is To Short';
                          },
                          onSaved: (text) {
                            userPassword = text;
                            print(userPassword);
                          },
                        ),
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
                // Container(
                //   child: progressIndicator
                //       ? SpinKitThreeBounce(
                //           color: Theme.of(context).accentColor,
                //           size: 30.0,
                //           duration: Duration(seconds: 1),
                //         )
                //       : SizedBox(
                //           height: 1.0,
                //         ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  child: Container(
                    height: 20.0,
                    width: 150.0,
                    child: Center(
                      child: progressIndicator
                          ? component.spinKitThreeBounce(
                              context, Theme.of(context).primaryColor)
                          : Text(
                              "CREATE ACCOUNT",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.0),
                            ),
                    ),
                  ),
                  // child: Text(
                  //   "CREATE ACCOUNT",
                  //   style: TextStyle(
                  //       color: Theme.of(context).primaryColor, fontSize: 15.0),
                  // ),
                  color: Theme.of(context).accentColor,
                  onPressed: () async {
                    final pref = await SharedPreferences.getInstance();
                    if (!(await component.checkInternetConnection())) {
                      component.showInSnackBar(context, _scaffoldKey,
                          "Please Connect To The Internet");
                    } else {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        progressIndicator = true;
                        setState(() {});
                        pref.setString('name', userName);
                        pref.setString('email', userEmail);
                        // createUser(userEmail, userPassword, userName)
                        //     .then((FirebaseUser signedInUser) {
                        //   pref.setBool('status', true);
                        //   Navigator.pushReplacement(context,
                        //       MaterialPageRoute(builder: (context) => Home()));
                        //   // UserManagment().storeNewUser(signedInUser, context);
                        // }).catchError((e) {
                        //   print(e);
                        // });
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

                // AbsorbPointer(
                //   absorbing: false,
                //   child: SpinKitThreeBounce(
                //     color: Theme.of(context).accentColor,
                //     size: 30.0,
                //   ),
                // ),

                // MaterialButton(
                //     height: 45.0,
                //     child: Text(
                //       'LOGIN',
                //       style: TextStyle(
                //           fontSize: 20.0, color: Theme.of(context).primaryColor),
                //     ),
                //     color: Theme.of(context).accentColor,
                //     onPressed: () {},
                //     splashColor: Theme.of(context).primaryColorDark,
                //     shape: new RoundedRectangleBorder(
                //         borderRadius: new BorderRadius.circular(30.0))),
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Divider(
                //       color: Theme.of(context).accentColor,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
