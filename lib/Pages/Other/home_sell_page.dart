import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groshop/Components/drawer.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Pages/Search/search_history.dart';
import 'package:groshop/Pages/Search/search_result.dart';

import '../../models/product.dart';

class HomeSellPage extends StatefulWidget {
  @override
  _HomeSellPageState createState() => _HomeSellPageState();
}

class _HomeSellPageState extends State<HomeSellPage> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);

    List<String> carouselImages = [
      'assets/HomeBanner/Banner0.png',
      'assets/HomeBanner/Banner1.png',
      'assets/HomeBanner/Banner2.png',
    ];

    final List<Product> products = [
      Product(
          image: "assets/ProductImages/onion.png",
          name: locale.freshRedOnios,
          type: "Pajeroma",
          price: "\$30.0",
          seller: "Nguyễn Kim Khánh"),
      Product(
          image: "assets/ProductImages/tomato.png",
          name: locale.freshRedTomatoes,
          type: "Lecoil Eeva",
          price: "\$44.0",
          seller: "Nguyễn Kim Khánh"),
    ];
    final List<Product> products2 = [
      Product(
          image: "assets/ProductImages/Cauliflower.png",
          name: locale.cauliFlower,
          type: "Calvis Dino",
          price: "\$35.0",
          seller: "Nguyễn Kim Khánh"),
      Product(
          image: "assets/ProductImages/Garlic.png",
          name: locale.freshGarlic,
          type: "Pajeroma",
          price: "\$30.0",
          seller: "Nguyễn Kim Khánh"),
    ];
    return Stack(
      children: [
        Column(
          children: [
            Image.asset('assets/header.png'),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: buildDrawer(context),
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(height: 12.0),
                Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: AppBar(
                        actions: [
                          IconButton(
                            icon: ImageIcon(AssetImage(
                              'assets/ic_cart.png',
                            )),
                            onPressed: () {
                              //todo
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             CheckOutNavigator()));
                            },
                          ),
                        ],
                        title: TextFormField(
                          readOnly: true,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchHistory()));
                          },
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                              hintText: locale.searchOnGroShop,
                              hintStyle: Theme.of(context).textTheme.subtitle2,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 196),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 16.0),
                      Stack(
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
                                viewportFraction: 1.0,
                                enlargeCenterPage: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            start: 20.0,
                            bottom: 0.0,
                            child: Row(
                              children: carouselImages.map((i) {
                                int index = carouselImages.indexOf(i);
                                return Container(
                                  width: 12.0,
                                  height: 3.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: _current == index
                                        ? Colors.white /*.withOpacity(0.9)*/
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      buildCompleteVerticalList(
                          locale, context, products, locale.fresharrived),
                      buildCompleteVerticalList(
                          locale, context, products2, locale.featuredProducts),
                      buildCompleteVerticalList(
                          locale, context, products2, locale.discountedItems),
                      buildCompleteVerticalList(
                          locale, context, products2, locale.topRated),
                      buildCompleteVerticalList(
                          locale, context, products, locale.fresharrived),
                      buildCompleteVerticalList(
                          locale, context, products2, locale.featuredProducts),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column buildCompleteVerticalList(AppLocalizations locale,
      BuildContext context, List<Product> products, String heading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(heading,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        buildList(products),
      ],
    );
  }
}

Container buildList(List<Product> products) {
  return Container(
    height: 240,
    child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: buildProductCard(
                  context,
                  products[index].image,
                  products[index].name,
                  products[index].type,
                  products[index].price),
            ),
          );
        }),
  );
}
