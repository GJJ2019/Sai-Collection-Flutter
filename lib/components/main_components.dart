import 'package:flutter/material.dart';

class MainComponent extends StatelessWidget {
  
  String name, imageName;
  MainComponent({this.name, this.imageName});  

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.all(20.0),
        width: 350.0,
        height: 200.0,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/$imageName.jpg',
                height: 200.0,
                width: 350.0,
                fit: BoxFit.cover,
                color: Colors.black54,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 40.0, fontFamily: 'Gotham Light'),
              ),
            )
          ],
        ),
      );
  }
}
