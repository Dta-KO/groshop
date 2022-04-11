import 'package:flutter/material.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Pages/Search/search_result.dart';
import 'package:groshop/Theme/colors.dart';

import '../../models/product.dart';

class CategoryProduct extends StatefulWidget {
  final String title;

  CategoryProduct(this.title);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Product> products = [
      Product(image: "assets/ProductImages/onion.png", name: locale.freshRedOnios,
         type: "Pajeroma", price: "\$30.0", seller: "Nguyễn Kim Khánh"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage(
              'assets/ic_cart.png',
            )),
            onPressed: () {
              //todo
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CheckOutNavigator()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildGridView(products),
      ),
    );
  }
}
