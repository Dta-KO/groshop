import 'package:flutter/material.dart';

import '../utils/helper.dart';

class TermsOfServiceRow extends StatelessWidget {
  // Params
  final Color color;

  TermsOfServiceRow({this.color = Colors.white});

  // Private variables

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Text(
            "Điều khoản",
            style: TextStyle(
                color: color,
                fontSize: 17,
                // decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Open terms of service page in browser
            openTermsPage();
          },
        ),
        Text(
          ' | ',
          style: TextStyle(
              color: color, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          child: Text(
            "Chính sách",
            style: TextStyle(
                color: color,
                fontSize: 17,
                // decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Open privacy policy page in browser
            openPrivacyPage();
          },
        ),
      ],
    );
  }
}
