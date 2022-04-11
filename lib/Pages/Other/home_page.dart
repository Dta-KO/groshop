import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groshop/Pages/Search/search_history.dart';

import '../../Locale/locales.dart';
import '../../models/category.dart';
import '../../models/product.dart';
import '../../models/vendor.dart';
import 'category_products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final List<Category> categories = [
      Category(
          image: 'assets/CategoryImages/iron.png',
          name: "Giặt sấy",
          type: locale.vegetables),
      Category(
          image: 'assets/CategoryImages/pawn.png',
          name: "Cầm đồ\ncầm cố",
          type: locale.vegetables),
      Category(
          image: 'assets/CategoryImages/supermarket.png',
          name: "Siêu thị\ntổng hợp",
          type: locale.vegetables),
      Category(
          image: 'assets/CategoryImages/drugstore.png',
          name: "Phòng khám\nNhà thuốc",
          type: locale.vegetables),
      Category(
          image: 'assets/CategoryImages/hotel.png',
          name: "Nhà Nghỉ\nKhách sạn",
          type: locale.vegetables),
      Category(
          image: 'assets/CategoryImages/forrent.png',
          name: "Cho Thuê\nMọi thứ",
          type: locale.vegetables),
    ];

    List<String> carouselImages = [
      'assets/HomeBanner/Banner0.png',
      'assets/HomeBanner/Banner1.png',
      'assets/HomeBanner/Banner2.png',
    ];

    List<Vendor> nearVendors = [
      Vendor(id: "1", name: "Cửa hàng Kim Khánh", image: 'assets/CategoryImages/hotel.png' )
    ];

    return Scaffold(
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
                      setState(() {});
                    }),
              ),
              InkWell(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchHistory()));
                },
              ),
              Container(
                height: 130,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return buildCategoryRow(index, context, categories);
                    }),
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
                    //list data near user
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector buildCategoryRow(int index, BuildContext context,
    List categories) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryProduct(categories[index].name)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(10),
        width: 96,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                    image: AssetImage(categories[index].image),
                    fit: BoxFit.fitWidth)),
            SizedBox(
              height: 2,
            ),
            Text(
              categories[index].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ));
}
