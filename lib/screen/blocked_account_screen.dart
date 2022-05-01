import 'package:flutter/material.dart';

class BlockedAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.lock_outline, size: 60, color: Colors.white),
          ),
          Text(
              "Bạn đã bị khóa tài khoản.\nChúng tôi thực hiện hành động này vì chúng tôi có dấu hiệu rõ ràng rằng Tài khoản của Bạn đã vi phạm chính sách của Good Here. Nếu bạn đã xem xét chính sách và cảm thấy việc chấm dứt này có thể do nhầm lẫn, vui lòng liên hệ với nhóm hỗ trợ chính sách của chúng tôi. "),
          Text("Email: goodhere.cpm@gmail.com",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    ));
  }
}
