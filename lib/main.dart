import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:groshop/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.green));
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    runApp(Phoenix(child: MyApp()));
  } else {
    Fluttertoast.showToast(
        msg:
            "Bạn cần cấp quyền truy cập vị trí để sử dụng ứng dụng này. \nĐóng ứng dụng và mở lại sau khi cấp quyền truy cập vị trí.",
        toastLength: Toast.LENGTH_LONG);
    await Geolocator.openAppSettings();
    await Geolocator.openLocationSettings();
  }
}
