
class Product {
  String? description;
  String image;
  String name;
  String type;
  String price;
  String seller;
  String? idProduct;

  Product(
      {required this.image,
        required this.name,
        required this.type,
        this.idProduct,
        this.description,
        required this.seller,
        required this.price});
}