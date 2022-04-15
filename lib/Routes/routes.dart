import 'package:flutter/material.dart';
import 'package:groshop/Auth/Login/sign_in.dart';
import 'package:groshop/Auth/Login/sign_up.dart';
import 'package:groshop/Auth/Login/verification.dart';
import 'package:groshop/Pages/Checkout/PaymentMode.dart';
import 'package:groshop/screen/address_page.dart';
import 'package:groshop/screen/home_screen.dart';
import 'package:groshop/screen/products_screen.dart';
import 'package:groshop/Pages/Other/language_choose.dart';
import 'package:groshop/Pages/Search/cart.dart';
import 'package:groshop/landing/landing_page.dart';

import '../screen/ConfirmOrder.dart';

class PageRoutes {
  static const String homePage = 'home_page';
  static const String productsScreen = 'products_screen';
  static const String signInRoot = 'sign_in';
  static const String signUp = 'sign_up';
  static const String verification = 'verification';
  static const String cartPage = 'root/checkout';
  static const String selectAddress = 'selectAddress/';
  static const String paymentMode = 'paymentMode';
  static const String confirmOrder = 'confirmOrder';
  static const String chooseLanguage = 'chooseLanguage';
  static const String landingPage = 'landingPage';

  Map<String, WidgetBuilder> routes() {
    return {
      homePage: (context) => HomeScreen(),
      signInRoot: (context) => SignIn(),
      signUp: (context) => SignUp(),
      verification: (context) => VerificationPage(() {
            Navigator.popAndPushNamed(context, PageRoutes.homePage);
          }),
      productsScreen: (context) => ProductsScreen(),
      cartPage: (context) => CartPage(() => Navigator.pop(context)),
      selectAddress: (context) => AddressPage(
            () => Navigator.pop(context),
          ),
      paymentMode: (context) => PaymentModePage(
            () => Navigator.pop(context),
          ),
      confirmOrder: (context) => ConfirmOrderPage(() {
            Navigator.pop(context);
          }),
      chooseLanguage: (context) => ChooseLanguage(),
      landingPage: (context) => LandingPage(),
    };
  }
}
