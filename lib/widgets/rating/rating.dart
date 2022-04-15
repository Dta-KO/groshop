/*
 * Created by Nguyen Kim Khanh on 4/13/22, 7:20 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 7:20 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:flutter/material.dart';

Container buildRating(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 1.5, bottom: 1.5, left: 4, right: 3),
    //width: 30,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Text(
          "4.2",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button?.copyWith(fontSize: 10),
        ),
        SizedBox(
          width: 1,
        ),
        Icon(
          Icons.star,
          size: 10,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    ),
  );
}
