import 'package:flutter/material.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Pages/Search/search_result.dart' as search;
import 'package:groshop/widgets/products/products_ui.dart';

import '../../models/category.dart';
import '../../models/product.dart';
import '../../widgets/categories/category_ui.dart';

class SearchHistory extends StatefulWidget {
  @override
  _SearchHistoryState createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  final List<String> _searchList = [];

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
          image: 'assets/CategoryImages/hotel.png',
          name: "Khách sạn",
         ),
      Category(
          image: 'assets/CategoryImages/iron.png',
          name: "Giặt sấy",
      ),
    ];
    final List<Product> products = [
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          onSubmitted: (s) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => search.SearchResult()));
            setState(() {
              _searchList.add(s);
            });
          },
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
              hintText: '  ' + "Tìm kiếm tại Good Here...",
              hintStyle: Theme.of(context).textTheme.subtitle2,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => search.SearchResult())),
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[400],
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1))),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _searchList.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Text(
                        "Tìm kiếm gần đây",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 144.0,
                      child: ListView.builder(
                        itemCount: _searchList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 16.0,
                                ),
                                child: Icon(Icons.youtube_searched_for,
                                    color: Theme.of(context).backgroundColor),
                              ),
                              Text(
                                _searchList[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
            child: Text(
              "Chọn loại sản phầm",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
          ),
          SizedBox(height: 12),
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
            padding: EdgeInsets.all(16),
            child: Text("Sản phẩm phổ biến",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 18)),
          ),
          buildListProducts(products),
        ],
      ),
    );
  }
}
