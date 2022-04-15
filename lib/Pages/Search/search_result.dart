import 'package:flutter/material.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Pages/Other/category_products.dart';

import '../../models/product.dart';
import '../../widgets/products/products_ui.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Product> products = [
      Product(
          image: "assets/ProductImages/onion.png",
          name: locale.freshRedOnios,
          seller: "Pajeroma",
          price: "\$30.0",
          type: ""),
      Product(
          image: "assets/ProductImages/onion.png",
          name: locale.freshRedOnios,
          seller: "Pajeroma",
          price: "\$30.0",
          type: ""),
      Product(
          image: "assets/ProductImages/onion.png",
          name: locale.freshRedOnios,
          seller: "Pajeroma",
          price: "\$30.0",
          type: ""),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextFormField(
          initialValue: ' ' + locale.fresh,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey[400],
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[400],
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryProduct(locale.resultsFound)));
              },
              child: Text(
                '72 ' + locale.resultsFound,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.grey[400], fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            buildGridView(products),
          ],
        ),
      ),
    );
  }
}

GridView buildGridView(List<Product> listName, {bool favourites = false}) {
  return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 20),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listName.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return buildProductCard(context, listName[index].image,
            listName[index].name, listName[index].type, listName[index].price,
            favourites: favourites);
      });
}
