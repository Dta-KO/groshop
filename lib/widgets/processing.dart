import 'package:flutter/material.dart';
import 'package:groshop/widgets/my_circular_progress.dart';

class Processing extends StatelessWidget {
  final String? text;

  const Processing({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MyCircularProgress(),
          SizedBox(height: 10),
          Text(text ?? "Đang thực thi...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          SizedBox(height: 5),
          Text("Vui lòng đợi trong giây lát!", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
