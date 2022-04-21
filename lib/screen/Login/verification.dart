import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/widgets/auth/social_login.dart';

class VerificationPage extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  @override
  Widget build(BuildContext context) {
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 28.0, left: 18, right: 18, bottom: 4),
              child: Text(
                "Nhập mã xác thực",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.w500),
              ),
            ),
            EntryField(
              hint: "123456",
            ),
            CustomButton(
              onTap: () {
                signInWithPhone(widget.phoneNumber, null, context);
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
                            text: "Gửi lại",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
