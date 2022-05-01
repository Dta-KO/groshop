import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/db/viewmodel/user_model.dart';
import 'package:groshop/landing/landing_page.dart';
import 'package:groshop/screen/Login/sign_up.dart';
import 'package:groshop/screen/Login/verification.dart';
import 'package:groshop/screen/blocked_account_screen.dart';
import 'package:groshop/widgets/show_scaffold_msg.dart';

import '../../widgets/auth/social_login.dart';
import '../../widgets/progress_dialog.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late ProgressDialog _pr;

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    _pr = ProgressDialog(context, isDismissible: false);

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
                keyboardType: TextInputType.phone,
              ),
              Spacer(
                flex: 1,
              ),
              CustomButton(
                onTap: () {
                  _pr.show("Đang thực thi...");

                  UserModel().verifyPhoneNumber(
                      phoneNumber: "+84${phoneController.text.trim()}",
                      checkUserAccount: () {
                        /// Auth user account
                        UserModel().authUserAccount(
                          homeScreen: () {
                            /// Go to home screen
                            Future(() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                            });
                          },
                          signUpScreen: () {
                            /// Go to sign up screen
                            Future(
                              () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                            );
                          },
                          blockedScreen: () {
                            Future(() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlockedAccountScreen()));
                            });
                          },
                        );
                      },
                      codeSent: (code) async {
                        // Hide progreess dialog
                        _pr.hide();
                        // Go to verification code screen
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerificationPage(
                                  verificationId: code,
                                )));
                      },
                      onError: (errorType) async {
                        // Hide progreess dialog
                        _pr.hide();

                        // Check Erro type
                        if (errorType == 'invalid_number') {
                          // Check error type
                          final String message =
                              "Chúng tôi không thể xác minh số điện thoại của bạn";
                          // Show error message
                          // Validate context
                          if (mounted) {
                            showScaffoldMessage(
                                context: context,
                                message: message,
                                bgcolor: Colors.red);
                          }
                        }
                      });
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
