import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Routes/routes.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 0, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.welcomeTo,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              Spacer(
                flex: 2,
              ),
              Image.asset(
                "assets/logo.png",
                fit: BoxFit.fitHeight,
                height: 150,
              ),
              Spacer(
                flex: 4,
              ),
              EntryField(
                label: locale.selectLanguage,
                hint: locale.vietnamesee,
                suffixIcon: (Icons.arrow_drop_down),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.chooseLanguage);
                },
              ),
              EntryField(
                label: locale.phoneNumber,
                hint: locale.enterPhoneNumber,
              ),
              Spacer(
                flex: 1,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.signUp);
                },
                margin: 28,
                radius: 5,
                padding: 15,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                locale.wellSendOTPForVerification,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
