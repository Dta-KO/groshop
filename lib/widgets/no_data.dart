import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String text;

  const NoData({required this.text});

  @override
  Widget build(BuildContext context) {
    // Handle icon

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Show icon
          Padding(
            padding: EdgeInsets.all(32),
            child: Image.asset(
              "assets/no_data.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(text,
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
