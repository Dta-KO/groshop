import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';

import '../../widgets/auth/social_login.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 0, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(
                flex: 1,
              ),
              Image.asset(
                "assets/logo.png",
                fit: BoxFit.fitHeight,
                height: 150,
              ),
              Image.asset(
                "assets/name_cpn.png",
                fit: BoxFit.fitHeight,
                height: 50,
              ),
              Spacer(
                flex: 3,
              ),
              EntryField(
                label: "Số điện thoại:",
                controller: phoneController,
              ),
              Spacer(
                flex: 1,
              ),
              CustomButton(
                onTap: () {
                  signInWithPhone(phoneController.text, null, context);
                },
                color: Colors.green,
                margin: 28,
                radius: 5,
                padding: 15,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "Nhấn tiếp tục để nhận mã xác thực.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(
                flex: 1,
              ),
              Align(
                child: Text("Hoặc", style: TextStyle(color: Colors.grey)),
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      signInWithGoogle(context);
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      signInWithFacebook(context);
                    },
                  ),
                  if (Platform.isIOS)
                    SignInButton(Buttons.Apple, onPressed: () {
                      signInWithApple(context);
                    })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
