import 'package:flutter/material.dart';
import 'package:groshop/Components/drawer.dart';
import 'package:groshop/Theme/colors.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(
          "Thông tin Good Here",
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(
              'assets/logo.png',
              scale: 2.5,
              height: 280,
            ),
            Text(
              "Về chúng tôi",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey[400]),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Good Here là ứng dụng cung cấp dịch vụ giặt ủi đầu tiên tại Việt Nam',
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
