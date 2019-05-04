import 'package:flutter/material.dart';
import 'package:sai_collections/components/card_product.dart';

class ListProducts extends StatefulWidget {
  String name;
  ListProducts(this.name);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
        ),
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
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardProduct(),
                  CardProduct(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
