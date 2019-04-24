import 'package:flutter/material.dart';
import 'package:sai_collections/components/card_product.dart';
import 'package:sai_collections/components/item_details.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hey There"),
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
              padding: const EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45 ,
                        width:  MediaQuery.of(context).size.width * 0.50,
                        child: CardProduct(),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemDetails()));
                      },
                    ),
                    // SizedBox(
                    //   width: 10.0,
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width:  MediaQuery.of(context).size.width * 0.50,
                      child: CardProduct(),
                    ),
                  ],
                ),
              ),
            );
          },
        )

        // body: Wrap(
        //   children: <Widget>[
        //     GridView.count(
        //     crossAxisCount: 2,
        //     children: <Widget>[
        //       Card(
        //         margin: const EdgeInsets.all(10.0),
        //         elevation: 4.0,
        //         child: Column(
        //           children: <Widget>[
        //             ClipRRect(
        //               borderRadius: BorderRadius.only(
        //                   topLeft: Radius.circular(15.0),
        //                   topRight: Radius.circular(15.0)),
        //               child: Image.asset(
        //                 'assets/images/t_shirt.jpg',
        //                 fit: BoxFit.contain,
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(4.0),
        //               child: Text(
        //                 "Special",
        //                 style: TextStyle(color: Colors.cyan),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(4.0),
        //               child: Text("Name of Cloth"),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(4.0),
        //               child: Text("\u20B9 700"),
        //             ),
        //           ],
        //         ),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(15.0),
        //         ),
        //       ),
        //     ],
        //   ),
        // ]
        // ),
        );
  }
}
