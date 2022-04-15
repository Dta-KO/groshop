/*
 * Created by Nguyen Kim Khanh on 4/13/22, 7:20 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 7:20 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:groshop/Routes/routes.dart';
import 'package:groshop/models/category.dart';
import 'package:groshop/utils/helper.dart';

GestureDetector buildCategoryRow(
    int index, BuildContext context, List<Category> categories) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.productsScreen);
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(10),
        width: 96,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                getUrlImage(categories[index].image),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              categories[index].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ));
}
