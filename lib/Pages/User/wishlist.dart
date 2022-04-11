import 'package:flutter/material.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Pages/Search/search_result.dart';
import 'package:groshop/Theme/colors.dart';

import '../../models/product.dart';


class MyWishList extends StatefulWidget {
  @override
  _MyWishListState createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Product> products = [
      Product(image: "assets/ProductImages/onion.png", name: locale.freshRedOnios,
          seller: "Pajeroma", price: "\$30.0", type: ""),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.myWishList.toUpperCase(),
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: buildGridView(products, favourites: true),
          ),
        ],
      ),
    );
  }
}
