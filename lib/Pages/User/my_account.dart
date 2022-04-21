import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';

import '../Other/add_address.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.green,
              boxShadow: [new BoxShadow(blurRadius: 15.0)],
              borderRadius: new BorderRadius.vertical(
                  bottom: new Radius.elliptical(
                      MediaQuery
                          .of(context)
                          .size
                          .width, 60.0)),
            ),
            child: AppBar(
              backgroundColor: Colors.green,
              title: Text("Tài Khoản Của Tôi"),
              centerTitle: true,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Tài khoản",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(
                      fontSize: 16, letterSpacing: 1, color: Color(0xffa9a9a9)),
                ),
                SizedBox(
                  height: 20,
                ),
                EntryField(
                  controller: TextEditingController()
                    ..text = 'Samantha Smith',
                  labelFontWeight: FontWeight.w400,
                  horizontalPadding: 0,
                  label: "Họ tên",
                  labelFontSize: 16,
                ),
                EntryField(
                  controller: TextEditingController()
                    ..text = 'dtako.developer@gmail.com',
                  labelFontWeight: FontWeight.w400,
                  horizontalPadding: 0,
                  label: "Email",
                  labelFontSize: 16,
                ),
                EntryField(
                  controller: TextEditingController()
                    ..text = '+1 987 654 3210',
                  labelFontWeight: FontWeight.w400,
                  horizontalPadding: 0,
                  label: "Số điện thoại",
                  labelFontSize: 16,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[100],
            thickness: 10,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Địa chỉ",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(
                      fontSize: 16, letterSpacing: 1, color: Color(0xffa9a9a9)),
                ),
                SizedBox(
                  height: 20,
                ),
                buildAddressTile("Nhà ở", "Vân Trường, Tiền Hải, Thái Bình"),
                SizedBox(
                  height: 20,
                ),
                buildAddressTile(
                    "Công sở", 'Kp3 Mỹ Bình, Phan Rang Tháp Chàm, Ninh Thuận'),
              ],
            ),
          ),
          Spacer(),
          Padding(padding: EdgeInsets.all(16), child: CustomButton(
            color: Colors.green,
            label: "Thêm Địa Chỉ",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddAddressPage()));
            },
          ) ,)
        ],
      ),
    );
  }

  ListTile buildAddressTile(String heading, String address) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
      title: Row(
        children: [
          Text(heading),
          Spacer(),
          Icon(
            Icons.edit,
            color: Color(0xff686868),
            size: 20,
          ),
        ],
      ),
      subtitle: Text(
        address,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
