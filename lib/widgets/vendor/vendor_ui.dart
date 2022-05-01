/*
 * Created by Nguyen Kim Khanh on 4/13/22, 7:20 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 7:20 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:groshop/models/address.dart';
import 'package:groshop/widgets/rating/rating.dart';

import '../../Locale/locales.dart';
import '../../Pages/Other/product_info.dart';
import '../../models/vendor.dart';

Column buildCompleteVerticalListVendor(AppLocalizations locale,
    BuildContext context, List<Vendor> vendors, String heading) {
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
      buildListVendor(vendors),
    ],
  );
}

Container buildListVendor(List<Vendor> vendors) {
  return Container(
    height: double.minPositive,
    child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              width: double.minPositive,
              child: buildVendorCard(
                  context,
                  vendors[index].image!,
                  vendors[index].name!,
                  vendors[index].address!,
                  vendors[index].rating),
            ),
          );
        }),
  );
}

Widget buildVendorCard(BuildContext context, String image, String name,
    GHAddress address, int? rating,
    {bool favourites = false}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductInfo()));
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              image,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            favourites
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 10.0),
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: '141/1 Nguyễn Công Trứ ABC DEF'),
              ),
              SizedBox(width: 10,),
              buildRating(context),
            ],
          ),
        ),
      ],
    ),
  );
}
