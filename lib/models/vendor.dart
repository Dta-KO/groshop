import 'package:groshop/models/product.dart';

import 'address.dart';

class Vendor {
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
  List<String>? promoCodes;

  Vendor(
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
      this.promoCodes});
}
