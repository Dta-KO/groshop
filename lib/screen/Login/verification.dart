import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/db/viewmodel/user_model.dart';
import 'package:groshop/landing/landing_page.dart';
import 'package:groshop/screen/Login/sign_in.dart';
import 'package:groshop/screen/Login/sign_up.dart';
import 'package:groshop/widgets/dialog.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/progress_dialog.dart';

class VerificationPage extends StatefulWidget {
  final String verificationId;

  VerificationPage({required this.verificationId});

  @override
  _VerificationPageState createState() {
    return _VerificationPageState();
  }
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController smsController = TextEditingController();
  late ProgressDialog _pr;

  @override
  Widget build(BuildContext context) {
    _pr = ProgressDialog(context, isDismissible: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Xác Thực Tài Khoản",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48.0, vertical: 48),
                child: Image.asset(
                  "assets/verify.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 28.0, left: 18, right: 18, bottom: 4),
              child: Text(
                "Nhập mã xác thực",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.w500),
              ),
            ),
            EntryField(
              hint: "123456",
              controller: smsController,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  if (smsController.text.isNotEmpty &&
                      smsController.text.trim().length == 6) {
                    validateOtp(smsController.text);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Vui lòng nhập đúng mã xác thực.");
                  }
                });
              },
              margin: 28,
              radius: 5,
              padding: 15,
              color: Colors.green,
            ),
            SizedBox(
              height: 30,
            ),
            Align(
                child: GestureDetector(
              child: RichText(
                  text: TextSpan(
                      text: "Bạn không nhận được mã?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      children: [
                    TextSpan(
                      text: "  ",
                    ),
                    TextSpan(
                        text: "Hãy thử lại",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ])),
              onTap: () {
                Future(() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignIn()));
                });
              },
            ))
          ],
        ),
      ),
    );
  }

  Future<String?> validateOtp(String otp) async {
    /// Handle entered verification code here
    ///
    /// Show progress dialog
    _pr.show("Đang thực thi...");

    await UserModel().signInWithOTP(
        verificationId: widget.verificationId,
        otp: otp,
        checkUserAccount: () {
          /// Auth user account
          UserModel().authUserAccount(homeScreen: () {
            /// Go to home screen
            _nextScreen(LandingPage());
          }, signUpScreen: () async {
            // AppHelper instance
            /// Check location permission
            if (await Permission.location.serviceStatus.isEnabled) {
              _nextScreen(SignUp());
            } else {
              Fluttertoast.showToast(
                  msg:
                      "Bạn cần cho phép ứng dụng sử dụng quyền truy cập vị trí.");
              PermissionStatus status = await Permission.location.request();
              if (status.isGranted) {
                _nextScreen(SignUp());
              } else {
                exit(0);
              }
            }
          });
        },
        onError: () async {
          // Hide dialog
          await _pr.hide();
          // Show error message to user
          errorDialog(context,
              message: "Chúng tôi không thể xác minh số điện thoại của bạn.");
        });

    // Hide progress dialog
    await _pr.hide();

    return null;
  }

  /// Navigate to next page
  void _nextScreen(screen) {
    // Go to next page route
    Future(() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);
    });
  }
}
