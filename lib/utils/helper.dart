/*
 * Created by Nguyen Kim Khanh on 4/13/22, 9:52 PM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 9:52 PM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */

import 'package:groshop/utils/constants.dart';

String getUrlImage(String? url) {
  if (url == null || url.isEmpty) {
    return Constants.noProductDemo;
  } else {
    return url;
  }
}