import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/Routes/routes.dart';
import 'package:groshop/Theme/colors.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../../utils/geo_support.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? sex;
  TextEditingController addressController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    List<String> sexLabels = ["Nam", "Nữ"];
    String? currentAddress;
    determinePosition().then((value) {
      Position positionDevice = value;
      getAddress(positionDevice.latitude, positionDevice.longitude)
          .then((value) {
        currentAddress = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đăng Ký Thông Tin",
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(
            flex: 1,
          ),
          EntryField(
            label: "Họ Tên (*)",
            hint: (user != null && user!.displayName != null)
                ? user!.displayName
                : "Nhập họ tên",
            keyboardType: TextInputType.name,
            suffixIcon: Icons.person_outline_rounded,
          ),
          EntryField(
            label: "Số điện thoại (*)",
            hint: (user != null && user!.phoneNumber != null)
                ? user!.phoneNumber
                : "Nhập số điện thoại của bạncủa bạn",
            controller: addressController,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icons.alternate_email_outlined,
          ),
          EntryField(
            label: "Email (Tùy chọn)",
            hint: (user != null && user!.email != null)
                ? user!.email
                : "Nhập email của bạn",
            controller: addressController,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icons.alternate_email_outlined,
          ),
          EntryField(
            label: "Địa chỉ (*)",
            hint: currentAddress != null
                ? currentAddress
                : "Nhập địa chỉ của bạn",
            controller: addressController,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icons.alternate_email_outlined,
          ),
          EntryField(
            label: "CBV",
            hint: "fgj",
            suffixIcon: Icons.place_outlined,
          ),
          EntryField(
            label: "Ngày sinh (Tùy chọn)",
            hint: "Nhập ngày sinh",
            keyboardType: TextInputType.datetime,
          ),
          RadioButtonGroup(
            activeColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.caption,
            onSelected: (selectSex) {
              setState(() {
                sex = selectSex;
              });
            },
            labels: sexLabels,
            itemBuilder: (Radio radioButton, Text title, int i) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 56.7,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ListTile(
                        leading: radioButton,
                        title: Text(
                          sexLabels[i],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Spacer(
            flex: 5,
          ),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.verification);
            },
            margin: 28,
            radius: 5,
            padding: 15,
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
