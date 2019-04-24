import 'package:flutter/material.dart';
import 'package:sai_collections/list_products.dart';

import 'components/main_components.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sai Collections"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: MainComponent(name: 'T-shirt', imageName: 't_shirt'),
              onTap: () {
                print("hey there");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListProducts()));
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            MainComponent(name: 'Formal Shirts', imageName: 'formal_shirts'),
            SizedBox(
              height: 15.0,
            ),
            MainComponent(name: 'Jeans', imageName: 'jeans'),
            SizedBox(
              height: 12.0,
            ),
            MainComponent(name: 'Lowers', imageName: 'lowers'),
          ],
        ),
      ),
      // body: Container(
      //   margin: const EdgeInsets.all(20.0),
      //   height: 200.0,
      //   width: 350.0,
      //   child: Center(
      //     child: Text(
      //       "T-shirt",
      //       style: TextStyle(
      //         color: Colors.cyan,
      //         fontSize: 30.0,
      //       ),
      //     ),
      //   ),
      //   foregroundDecoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(18.0),
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/t_shirt.jpg'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlutterLogo(
                    size: 50.0,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Gaurav Jajoo",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0),
                    ),
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
              onTap: () {},
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
              onTap: () {},
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
      ),
    );
  }
}
