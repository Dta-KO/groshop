import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/drawer.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/Theme/colors.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(
          "Liên hệ Good Here!",
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/logo.png',
            scale: 2.5,
            height: 280,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Hãy cho chúng tôi biết ý kiến của bạn để chúng tôi có thể nâng cấp chất lượng dịch vụ.",
              style:
                  Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 19),
            ),
          ),
          Spacer(),
          EntryField(
              labelFontSize: 16,
              controller: TextEditingController()..text = 'Nhập tên bạn',
              labelFontWeight: FontWeight.w400,
              label: "Họ Tên"),
          EntryField(
              controller: TextEditingController()..text = 'Nhập số điện thoại',
              labelFontSize: 16,
              labelFontWeight: FontWeight.w400,
              label: "Số điện thoại"),
          EntryField(
              hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: kHintColor,
                  fontSize: 18.3,
                  fontWeight: FontWeight.w400),
              hint: "Nhập góp ý của bạn",
              labelFontSize: 16,
              labelFontWeight: FontWeight.w400,
              label: "Phản hồi"),
          Spacer(),
          CustomButton(
            label: "Gửi",
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
