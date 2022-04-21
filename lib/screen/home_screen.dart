import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groshop/Pages/Search/search_history.dart';
import 'package:groshop/db/viewmodel/viewmodel_category.dart';
import 'package:groshop/models/address.dart';
import 'package:groshop/widgets/categories/category_ui.dart';
import 'package:groshop/widgets/vendor/vendor_ui.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../models/vendor.dart';
import '../widgets/products/products_ui.dart';

class HomeScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    List<String> carouselImages = [
      'assets/HomeBanner/Banner1.png',
      'assets/HomeBanner/Banner0.png',
      'assets/HomeBanner/Banner2.png',
    ];

    List<Vendor> nearVendors = [
      Vendor(
        id: "1",
        name: "Cửa hàng Kim Khánh",
        image: 'assets/StoreImages/store1.png',
        address: Address(),
        rating: 5,
      ),
      Vendor(
        id: "1",
        name: "Cửa hàng Kim Khánh",
        image: 'assets/StoreImages/store2.png',
        address: Address(),
        rating: 5,
      ),
      Vendor(
        id: "1",
        name: "Cửa hàng Kim Khánh",
        image: 'assets/StoreImages/store3.png',
        address: Address(),
        rating: 5,
      ),
      Vendor(
        id: "1",
        name: "Cửa hàng Kim Khánh",
        image: 'assets/StoreImages/store1.png',
        address: Address(),
        rating: 5,
      ),
      Vendor(
        id: "1",
        name: "Cửa hàng Kim Khánh",
        image: 'assets/StoreImages/store2.png',
        address: Address(),
        rating: 5,
      ),
      Vendor(
        id: "1",
        name: "Cửa hàng Kim Khánh",
        image: 'assets/StoreImages/store3.png',
        address: Address(),
        rating: 5,
      )
    ];
    List<Product> products = [
      Product(
          image: "assets/ProductImages/comfor.png",
          name: "Nước xả",
          type: "Nước xả",
          price: "\$7.0",
          seller: "Cửa hàng Ánh Kim"),
      Product(
          image: "assets/ProductImages/washing.png",
          name: "Máy giặt lồng ngang",
          type: "Máy giặt",
          price: "\$300.0",
          seller: "CTY TNHH Kim Khánh"),
      Product(
          image: "assets/ProductImages/comfor.png",
          name: "Nước xả",
          type: "Nước xả",
          price: "\$7.0",
          seller: "Cửa hàng Ánh Kim"),
      Product(
          image: "assets/ProductImages/washing.png",
          name: "Máy giặt lồng ngang",
          type: "Máy giặt",
          price: "\$300.0",
          seller: "CTY TNHH Kim Khánh"),
      Product(
          image: "assets/ProductImages/comfor.png",
          name: "Nước xả",
          type: "Nước xả",
          price: "\$7.0",
          seller: "Cửa hàng Ánh Kim"),
      Product(
          image: "assets/ProductImages/washing.png",
          name: "Máy giặt lồng ngang",
          type: "Máy giặt",
          price: "\$300.0",
          seller: "CTY TNHH Kim Khánh"),
    ];
    return ScopedModel<ViewModelCategory>(
      model: ViewModelCategory(),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CarouselSlider(
                  items: carouselImages.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(child: Image.asset(i)),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                      }),
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(child: Text("Tìm kiếm trên Good Here...")),
                        Icon(Icons.search_outlined),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchHistory()));
                  },
                ),
                Container(
                    height: 130,
                    child: ScopedModelDescendant<ViewModelCategory>(builder: (context, child, model) {
                      model.getCategories();
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.categories.length,
                          itemBuilder: (context, index) {
                            return buildCategoryRow(index, context, model.categories);
                          });
                    },)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    children: [
                      Divider(color: Colors.grey, thickness: 1),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          "Gần bạn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      //list vendor near user
                      buildListVendor(nearVendors),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(color: Colors.grey, thickness: 1),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          "Sản phẩm phổ biến",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      buildListProducts(products),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
