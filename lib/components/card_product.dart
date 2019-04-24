import 'package:flutter/material.dart';

class CardProduct extends StatefulWidget {
  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
              child: Image.asset(
                'assets/images/t_shirt.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text(
                "Special",
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text("Name of Cloth"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text("\u20B9 700"),
            )
          ],
        ),
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
