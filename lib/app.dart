import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groshop/Routes/routes.dart';
import 'package:groshop/landing/landing_page.dart';
import 'package:groshop/screen/Login/sign_in.dart';
import 'package:groshop/screen/Login/verification.dart';

class MyApp extends StatefulWidget {
  static final String route = "/MyApp";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: Splash());
        } else {
          return startActivity(context);
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.fill,
                height: 220,
                width: 150,
                alignment: Alignment.center,
              ),
              Image.asset(
                "assets/name_cpn.png",
                fit: BoxFit.fill,
                width: 150,
                alignment: Alignment.center,
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ));
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 2));
  }
}

Widget startActivity(BuildContext context) {
  return AfterSplash();
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateRoute: (settings) {
      //   if (settings.name == PageRoutes.verification) {
      //     final args = settings.arguments as String;
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return VerificationPage(
      //           phoneNumber: args,
      //         );
      //       },
      //     );
      //   }
      // },
      debugShowCheckedModeBanner: false,
      routes: PageRoutes.routes(),
      home: RenderFirstScreen(),
    );
  }
}

// ignore: must_be_immutable
class RenderFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return renderFirstScreen();
  }

  Widget renderFirstScreen() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return SignIn();
    } else {
      return LandingPage();
    }
  }
}
