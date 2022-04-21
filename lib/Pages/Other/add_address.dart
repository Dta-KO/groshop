import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thêm Địa Chỉ",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Tiếp tục",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset('assets/map.png', fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      Icons.check_box,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: EntryField(
                    horizontalPadding: 0,
                    labelFontSize: 15,
                    labelFontWeight: FontWeight.w400,
                    label: "Tiêu đề",
                    controller: TextEditingController()..text = "Nhà riêng",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 20),
                SizedBox(width: 15),
                Text(
                  'Kp3, Mỹ Bình, Phan Rang',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          CustomButton(
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
