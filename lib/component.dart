import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitThreeBounce;

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
}

// class Component {}
