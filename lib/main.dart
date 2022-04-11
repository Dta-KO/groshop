import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:groshop/Auth/Login/sign_in.dart';
import 'package:groshop/Auth/Login/sign_up.dart';
import 'package:groshop/landing/landing_page.dart';

import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';
import 'language_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.green));
  runApp(Phoenix(child: GoodHere()));
}

class GoodHere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          return MaterialApp(
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
            ],
            locale: locale,
            theme: appTheme,
            home: LandingPage(),
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
