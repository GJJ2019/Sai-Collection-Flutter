import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Icon(
                        Icons.email,
                        color: Theme.of(context).accentColor,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0, left: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
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
                      padding: const EdgeInsets.only(left: 50.0),
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
                            hintStyle: TextStyle(fontSize: 18.0),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
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
                      padding: const EdgeInsets.only(right: 40.0, left: 10.0),
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
                          ? SpinKitThreeBounce(
                              color: Theme.of(context).primaryColor,
                              size: 30.0,
                              duration: Duration(milliseconds: 800),
                            )
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
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      progressIndicator = true;
                      setState(() {});
                      final pref = await SharedPreferences.getInstance();
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: userEmail, password: userPassword)
                          .then((FirebaseUser user) {
                        pref.setBool('status', true);
                        // String name = Firestore.instance.collection('/users').getDocuments('name').
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }).catchError((e) {
                        print(e);
                      });
                      // if (userEmail == 'gauravjajoo98@gmail.com' &&
                      //     userPassword == 'Gaurav1998') {
                      //   await pref.setBool('status', true);
                      //   print(pref.getBool('status'));
                      //   Navigator.pushReplacement(context,
                      //       MaterialPageRoute(builder: (context) => Home()));
                      // }
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  splashColor: Theme.of(context).primaryColor,
                ),
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
