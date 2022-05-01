/*
 * Created by Nguyen Kim Khanh on 4/13/22, 9:52 PM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 9:52 PM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */

import 'package:geocoding/geocoding.dart';
import 'package:groshop/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

String getUrlImage(String? url) {
  if (url == null || url.isEmpty) {
    return Constants.noProductDemo;
  } else {
    return url;
  }
}
/// Open Privacy Policy Page in Browser
Future<void> openPrivacyPage() async {
  //todo
  if (await canLaunchUrl(Uri.parse(""))) {
    await launchUrl(Uri.parse(""));
  } else {
    throw "Could not launch url";
  }
}

/// Open Terms of Services in Browser
Future<void> openTermsPage() async {
  // Try to launch
  //todo
  if (await canLaunchUrl(Uri.parse(""))) {
    await launchUrl(Uri.parse(""));
  } else {
    throw "Could not launch url";
  }
}

/// Get User location from formatted address
Future<Placemark> getUserAddress(double latitude, double longitude) async {
  /// Place object containing formatted address info
  Placemark place;

  ///  Get Placemark to retrieve user location
  final List<Placemark> places =
  await placemarkFromCoordinates(latitude, longitude);

  /// Get and returns the first place
  place = places.first;

  return place;
}