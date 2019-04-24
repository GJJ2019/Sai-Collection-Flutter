import 'package:flutter/material.dart';
import 'package:sai_collections/login/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String show = "Show";
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                      child: TextField(
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
                      Icons.person,
                      color: Theme.of(context).accentColor,
                      size: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0, left: 20.0),
                      child: TextField(
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: TextStyle(
                            fontSize: 18.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        cursorColor: Theme.of(context).accentColor,
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
                      child: TextField(
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 18.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        obscureText: passwordVisible,
                        cursorColor: Theme.of(context).accentColor,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: new Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 15.0),
                  ),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {},
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
    );
  }
}
