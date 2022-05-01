import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:geocode/geocode.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/Routes/routes.dart';
import 'package:groshop/widgets/dialog.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../db/viewmodel/user_model.dart';
import '../../widgets/image_source_sheet.dart';
import '../../widgets/show_scaffold_msg.dart';
import '../../widgets/terms_of_service_row.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  String sex = 'Nam';
  int idSex = 1;
  File? _imageFile;
  int _userBirthDay = 14;
  int _userBirthMonth = 3;
  int? _userBirthYear = DateTime.now().year;
  double lat = 0;
  double log = 0;
  GeoCode geo = GeoCode(apiKey: "AIzaSyAp1HcX_ufE3LFU7_1Ht-BV6JGWlSmZvGw");
  bool _agreeTerms = false;

  DateTime _initialDateTime = DateTime.now();

  /// Get image from camera / gallery
  void _getImage(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => ImageSourceSheet(
              onImageSelected: (image) {
                if (image != null) {
                  setState(() {
                    _imageFile = image;
                  });
                  // close modal
                  Navigator.of(context).pop();
                }
              },
            ));
  }

  // Get Date time picker app locale
  DateTimePickerLocale _getDatePickerLocale() {
    // Inicial value
    DateTimePickerLocale _locale = DateTimePickerLocale.vi;
    return _locale;
  }

  void _updateUserBirthdayInfo(DateTime date) {
    setState(() {
      // Update the inicial date
      _initialDateTime = date;
      // User birthday info
      _userBirthDay = date.day;
      _userBirthMonth = date.month;
      _userBirthYear = date.year;
      birthdayController.text =
          "$_userBirthDay/$_userBirthMonth/$_userBirthYear";
    });
  }

  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text("Xong",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Theme.of(context).primaryColor)),
      ),
      minDateTime: DateTime(1920, 1, 1),
      maxDateTime: DateTime.now(),
      initialDateTime: _initialDateTime,
      dateFormat: 'dd-MM-yyyy',
      // Date format
      locale: _getDatePickerLocale(),
      // Set your App Locale here
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        // Get birthday info
        _updateUserBirthdayInfo(dateTime);
      },
      onConfirm: (dateTime, List<int> index) {
        // Get birthday info
        _updateUserBirthdayInfo(dateTime);
      },
    );
  }

  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    Address address = await geo.reverseGeocoding(
        latitude: position.latitude, longitude: position.longitude);
    addressController.text =
        "${address.streetNumber}, ${address.streetAddress}, ${address.region}";
  }

  void showLocationsPicker(BuildContext context) async {
    LocationResult? result = await showLocationPicker(
      context,
      "AIzaSyAp1HcX_ufE3LFU7_1Ht-BV6JGWlSmZvGw",
      initialCenter: LatLng(10.795139, 106.626516),
      myLocationButtonEnabled: true,
      countries: [
        'VN',
      ],
    );
    Address address = await geo.reverseGeocoding(latitude: lat, longitude: log);
    setState(() {
      lat = result!.latLng!.latitude;
      log = result.latLng!.longitude;
      addressController.text =
          "${address.streetNumber}, ${address.streetAddress}, ${address.region}";
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrentPosition();

    return ScopedModel<UserModel>(
      model: UserModel(),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.green,
                  boxShadow: [new BoxShadow(blurRadius: 15.0)],
                  borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width, 60.0)),
                ),
                child: AppBar(
                  backgroundColor: Colors.green,
                  title: Text("Đăng Ký Thông Tin"),
                  centerTitle: true,
                ),
              )),
          body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        height: 115,
                        width: 115,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            _imageFile == null
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Image.asset("assets/man.png"),
                                  )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(_imageFile!),
                                  ),
                            Positioned(
                                height: 40,
                                width: 40,
                                bottom: 0,
                                right: -10,
                                child: RawMaterialButton(
                                  onPressed: () {
                                    /// Get profile image
                                    _getImage(context);
                                  },
                                  elevation: 2.0,
                                  fillColor: Color(0xFFF5F6F9),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  shape: CircleBorder(),
                                )),
                          ],
                        ),
                      ),
                    ),
                    EntryField(
                      label: "Họ Tên (*)",
                      hint: (user != null && user!.displayName != null)
                          ? user!.displayName
                          : "Nhập họ tên",
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      suffixIcon: Icons.person_outline_rounded,
                    ),
                    EntryField(
                      label: "Số điện thoại (*)",
                      hint: (user != null && user!.phoneNumber != null)
                          ? user!.phoneNumber
                          : "Nhập số điện thoại của bạn",
                      controller: phoneController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.phone,
                    ),
                    EntryField(
                      label: "Email (Tùy chọn)",
                      hint: (user != null && user!.email != null)
                          ? user!.email
                          : "Nhập email của bạn",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.alternate_email_outlined,
                    ),
                    EntryField(
                      label: "Địa chỉ (*)",
                      hint: "Nhập địa chỉ của bạn",
                      controller: addressController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.place,
                      onSuffixPressed: () => showLocationsPicker(context),
                    ),
                    EntryField(
                      label: "Ngày sinh (Tùy chọn)",
                      hint: "$_userBirthDay/$_userBirthMonth/$_userBirthYear",
                      keyboardType: TextInputType.datetime,
                      controller: birthdayController,
                      suffixIcon: Icons.calendar_today,
                      onSuffixPressed: () => _showDatePicker(),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            activeColor: Colors.green,
                            groupValue: idSex,
                            onChanged: (val) {
                              setState(() {
                                sex = 'Nam';
                                idSex = 1;
                              });
                            },
                          ),
                          Text(
                            'Nam',
                            style: new TextStyle(fontSize: 17.0),
                          ),
                          Radio(
                            value: 2,
                            activeColor: Colors.green,
                            groupValue: idSex,
                            onChanged: (val) {
                              setState(() {
                                sex = 'Nữ';
                                idSex = 2;
                              });
                            },
                          ),
                          Text(
                            'Nữ',
                            style: new TextStyle(fontSize: 17.0),
                          ),
                          Radio(
                            value: 3,
                            groupValue: idSex,
                            activeColor: Colors.green,
                            onChanged: (val) {
                              setState(() {
                                sex = 'Khác';
                                idSex = 3;
                              });
                            },
                          ),
                          Text(
                            'Khác',
                            style: new TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: _agreePrivacy(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onTap: () => _createAccount(model),
                      margin: 28,
                      radius: 5,
                      padding: 15,
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  /// Set terms
  void _setAgreeTerms(bool value) {
    setState(() {
      _agreeTerms = value;
    });
  }

  Widget _agreePrivacy() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Checkbox(
              activeColor: Theme.of(context).primaryColor,
              value: _agreeTerms,
              onChanged: (value) {
                _setAgreeTerms(value!);
              }),
          Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () => _setAgreeTerms(!_agreeTerms),
                  child:
                      Text("Tôi đồng ý với ", style: TextStyle(fontSize: 16))),
              // Terms of Service and Privacy Policy
              TermsOfServiceRow(color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  /// Handle Create account
  void _createAccount(UserModel model) async {
    /// check image file
    if (!_agreeTerms) {
      // Show error message
      showScaffoldMessage(
          context: context,
          message: "Bạn cần đồng ý chính sách và điều khoản Good Here.",
          bgcolor: Colors.red);

      /// Validate form
    } else if (model.calculateUserAge(_initialDateTime) < 18) {
      // Show error message
      showScaffoldMessage(
          context: context,
          duration: Duration(seconds: 7),
          message: "Chỉ 14 tuổi trở lên mới được tạo tài khoản.",
          bgcolor: Colors.red);
    } else {
      /// Call sign up method
      model.signUp(
          image: _imageFile!,
          email: emailController.text,
          heading: "Home",
          phone: phoneController.text,
          name: nameController.text.trim(),
          address: addressController.text,
          lat: lat,
          lng: log,
          sex: sex,
          birthday: birthdayController.text,
          onSuccess: () async {
            // Show success message
            successDialog(context, message: "Tạo tài khoản thành công.",
                positiveAction: () {
              // Execute action
              Navigator.pushNamed(context, PageRoutes.homePage);
            });
          },
          onFail: (error) {
            // Debug error
            debugPrint(error);
            // Show error message
            errorDialog(context,
                message:
                    "Lỗi đã xảy ra khi tạo tài khoản.\nVui lòng thử lại sau ít phút.");
          });
    }
  }
}
