/*
 * Created by Nguyen Kim Khanh on 4/13/22, 7:20 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 7:20 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:flutter/material.dart';

import '../../Pages/Other/product_info.dart';
import '../../models/product.dart';
import '../rating/rating.dart';

Column buildCompleteProductsVerticalList(
    BuildContext context, List<Product> products, String heading) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(16),
        child: Text(heading,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      buildListProducts(products),
    ],
  );
}

Container buildListProducts(List<Product> products) {
  return Container(
    height: 240,
    child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: buildProductCard(
                  context,
                  products[index].image,
                  products[index].name,
                  products[index].type,
                  products[index].price),
            ),
          );
        }),
  );
}

Widget buildProductCard(
    BuildContext context, String image, String name, String type, String price,
    {bool favourites = false}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductInfo()));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              image,
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              fit: BoxFit.fill,
            ),
            favourites
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
        Text(type, style: TextStyle(color: Colors.grey[500], fontSize: 10)),
        SizedBox(height: 4),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              buildRating(context),
            ],
          ),
        ),
      ],
    ),
  );
}
