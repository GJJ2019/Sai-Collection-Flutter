import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitThreeBounce;
import 'package:sai_collections/home.dart';
import 'package:sai_collections/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Component {
  String userEmail, userPassword, userName;

  void showInSnackBar(BuildContext context,
      GlobalKey<ScaffoldState> _scaffoldKey, String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: Text(
        value,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      backgroundColor: Theme.of(context).accentColor,
    ));
  }

  Future<bool> checkInternetConnection(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  Widget spinKitThreeBounce(BuildContext context, Color color) {
    return SpinKitThreeBounce(
      color: color,
      size: 25.0,
      duration: Duration(milliseconds: 850),
    );
  }

  Widget textFormFieldEmail(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          fontSize: 18.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      cursorColor: Theme.of(context).accentColor,
      validator: (value) {
        if (value.isEmpty) return 'Email Can\'t Be Empty :(';
        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
          return 'Invalid Email :(';
      },
      onSaved: (text) {
        userEmail = text.toString();
        // print(userEmail);
      },
      // onFieldSubmitted: (text){
      //   userEmail = text.toString();
      // },
    );
  }

  Widget textFormFieldPassword(BuildContext context, bool passwordVisible) {
    return TextFormField(
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(fontSize: 18.0),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
      ),
      obscureText: passwordVisible,
      cursorColor: Theme.of(context).accentColor,
      validator: (value) {
        if (value.isEmpty) return 'Password Can\'t Be Empty';
        if (value.length < 4) return 'Your Password Is To Short';
      },
      onSaved: (text) {
        userPassword = text;
      },
    );
  }

  Widget textFormFieldName(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        hintText: "Full Name",
        hintStyle: TextStyle(
          fontSize: 18.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
      ),
      cursorColor: Theme.of(context).accentColor,
      validator: (value) {
        if (value.isEmpty) return 'Name Can\'t Be Empty';
        if (value.length < 6) return 'Your Name Is To Short';
      },
      onSaved: (value) {
        userName = value;
      },
    );
  }

  Widget showDrawer(BuildContext context, String email) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    email[0].toUpperCase(),
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  radius: 25.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Hello,",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  email,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 15.0),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Theme.of(context).accentColor,
            height: 1.0,
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "My Cart",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {},
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Theme.of(context).accentColor,
            height: 1.0,
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "My Wishlist",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {},
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Theme.of(context).accentColor,
            height: 1.0,
          ),
          ListTile(
            leading: Icon(
              Icons.add_shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "My Order",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {},
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Theme.of(context).accentColor,
            height: 1.0,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "My Account",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {},
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Theme.of(context).accentColor,
            height: 1.0,
          ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Log Out",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () async {
              final pref = await SharedPreferences.getInstance();
              FirebaseAuth.instance.signOut().then((value) {
                pref.setBool('status', false);
                pref.setString('email', 'Guest');
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }).catchError((e) {
                print(e);
              });
            },
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            color: Theme.of(context).accentColor,
            height: 1.0,
          ),
          Center(
              child: Text(
            "Created By GJJ1998",
            style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
          )),
          SizedBox(
            height: 7.0,
          ),
          Center(
              child: Text(
            "\u00A9 Copyright By Grass-International",
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ))
        ],
      ),
    );
  }
}

// class Component {}
