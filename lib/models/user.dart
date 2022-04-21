import 'package:groshop/models/address.dart';
import 'package:groshop/models/product.dart';
import 'package:groshop/utils/constants.dart';

class User {
  String id;
  String? name;
  String? token;
  String? phoneNumber;
  Address? address;
  String? email;
  String? sex;
  String? birthday;
  int? amount;
  String? image;
  List<Product>? purchasedProducts;
  List<Product>? orderProducts;

  User(
      {required this.id,
      this.token,
      this.name,
      this.phoneNumber,
      this.email,
      this.address,
      this.sex,
      this.birthday,
      this.amount,
      this.image,
      this.purchasedProducts,
      this.orderProducts});

  /// factory user object
  factory User.fromDocument(Map<String, dynamic> doc) {
    return User(
        id: doc[Constants.ID],
        name: doc[Constants.NAME],
        phoneNumber: doc[Constants.PHONE_NUMBER],
        email: doc[Constants.EMAIL],
        sex: doc[Constants.SEX],
        birthday: doc[Constants.BIRTHDAY],
        amount: doc[Constants.AMOUNT],
        image: doc[Constants.IMAGE],
        purchasedProducts: doc[Constants.PURCHASED_PRODUCTS],
        orderProducts: doc[Constants.ORDER_PRODUCTS],
        address: doc[Constants.ADDRESS],
        token: doc[Constants.TOKEN]);
  }
}
