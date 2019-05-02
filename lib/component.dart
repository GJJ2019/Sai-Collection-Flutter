import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Component {
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

  Future<bool> checkInternetConnection() async {
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
}
