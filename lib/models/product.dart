
class Product {
  String? description;
  String image;
  String name;
  String type;
  String price;
  String seller;

  Product(
      {required this.image,
        required this.name,
        required this.type,
        this.description,
        required this.seller,
        required this.price});
}