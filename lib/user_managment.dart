import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sai_collections/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagment {
  storeNewUser(user, context) async {
    final pref = await SharedPreferences.getInstance();
    // Firestore.instance.collection('/users').add({
    //   'email': user.email,
    //   'uid': user.uid,
    //   'name': pref.getString('name')
    // })
    await user.reload();
    Firestore.instance.collection('users').document().setData({
      'name': pref.getString('name'),
      'uid': user.uid,
      'email': user.email,
      // 'isEmailVerified': user.isEmailVerified, // will also be false
      // 'photoUrl': user.photoUrl, // will always be null
    }).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((e) {
      print(e);
    });
  }
}
