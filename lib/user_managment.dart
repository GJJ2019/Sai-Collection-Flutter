import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sai_collections/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagment {
  storeNewUser(user, context) async {
    final pref = await SharedPreferences.getInstance();
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
      'name': pref.getString('name')
    }).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    name: pref.getString('name'),
                  )));
    }).catchError((e) {
      print(e);
    });
  }
}
