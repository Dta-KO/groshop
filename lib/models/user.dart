import 'package:groshop/models/address.dart';
import 'package:groshop/models/product.dart';

class User {
  String id;
  String? name;
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
}
