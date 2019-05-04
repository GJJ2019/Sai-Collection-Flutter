import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Name"),
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        elevation: 0.0,
        bottom: PreferredSize(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            color: Theme.of(context).accentColor,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(0.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              autoPlay: true,
              pauseAutoPlayOnTouch: Duration(seconds: 5),
              height: 300.0,
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/lowers.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text(
                "Name of brand",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text("Name of Cloth"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text(
                "\u20B9 700",
                style: TextStyle(fontSize: 24.0, fontFamily: 'Gotham Light'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text("Product Details "),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 30.0, right: 30.0),
            child: new Text(
              "ADD TO CART",
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 12.0),
            ),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {},
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Theme.of(context).accentColor)),
          splashColor: Theme.of(context).accentColor,
        ),
        RaisedButton(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 30.0, right: 30.0),
            child: new Text(
              "BUY NOW",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 12.0),
            ),
          ),
          color: Theme.of(context).accentColor,
          onPressed: () {},
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          splashColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
