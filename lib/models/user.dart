import 'package:groshop/models/product.dart';
import 'package:groshop/utils/constants.dart';

class User {
  final String id;
  final String name;
  final String? phoneNumber;
  final String? heading;
  final double? lat;
  final double? lng;
  final String? address;
  final String? email;
  final String? sex;
  final String? birthday;
  final int? amount;
  final String? image;
  final String? status;
  final Map<String, dynamic> purchasedProducts;
  final Map<String, dynamic> orderProducts;
  final DateTime userRegDate;
  final DateTime userLastLogin;
  final String userDeviceToken;

  User(
      {required this.id,
      required this.userRegDate,
      required this.userLastLogin,
      required this.userDeviceToken,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.lng,
      required this.lat,
      required this.heading,
      required this.address,
      required this.sex,
      required this.status,
      required this.birthday,
      required this.amount,
      required this.image,
      required this.purchasedProducts,
      required this.orderProducts});

  /// factory user object
  factory User.fromDocument(Map<String, dynamic> doc) {
    return User(
      id: doc[Constants.ID],
      name: doc[Constants.NAME],
      phoneNumber: doc[Constants.PHONE_NUMBER],
      email: doc[Constants.EMAIL],
      sex: doc[Constants.SEX],
      heading: doc[Constants.HEADING],
      lat: doc[Constants.LAT],
      lng: doc[Constants.LNG],
      address: doc[Constants.ADDRESS],
      userDeviceToken: doc[Constants.USER_DEVICE_TOKEN],
      userLastLogin: doc[Constants.USER_LAST_LOGIN],
      userRegDate: doc[Constants.USER_REG_DATE],
      birthday: doc[Constants.BIRTHDAY],
      amount: doc[Constants.AMOUNT],
      image: doc[Constants.IMAGE],
      status: doc[Constants.STATUS],
      purchasedProducts: doc[Constants.PURCHASED_PRODUCTS],
      orderProducts: doc[Constants.ORDER_PRODUCTS],
    );
  }
}
