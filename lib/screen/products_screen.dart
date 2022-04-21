import 'package:flutter/material.dart';
import 'package:groshop/Pages/Search/search_history.dart';
import 'package:groshop/Routes/routes.dart';
import 'package:scoped_model/scoped_model.dart';

import '../db/viewmodel/viewmodel_category.dart';
import '../models/category.dart';
import '../widgets/categories/category_ui.dart';

class ProductsScreen extends StatelessWidget {
  final String id;

  ProductsScreen({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 90.0,
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    boxShadow: [new BoxShadow(blurRadius: 15.0)],
                    borderRadius: new BorderRadius.vertical(
                        bottom: new Radius.elliptical(
                            MediaQuery.of(context).size.width, 60.0)),
                  ),
                  child: AppBar(
                    actions: [
                      IconButton(
                        icon: ImageIcon(AssetImage(
                          'assets/ic_cart.png',
                        )),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             CheckOutNavigator()));
                          Navigator.pushNamed(context, PageRoutes.cartPage);
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
                          ?.copyWith(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Tìm kiếm trên Good Here...",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Danh mục sản phẩm",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  height: 140,
                  child: ScopedModel(
                    model: ViewModelCategory(),
                    child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: ScopedModelDescendant<ViewModelCategory>(
                            builder: (context, child, model) {
                          model.getSubCategories(id);
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.subCategories.length,
                            itemBuilder: (context, index) {
                              return buildSubCategoryRow(
                                  index, context, model.subCategories);
                            },
                          );
                        })),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Cửa hàng gần bạn",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sản phẩm khuyến mại",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

int getIndexSubCategory(List<Category> categories, String categoryName) {
  int indexCategory = 0;
  for (int i = 0; i < categories.length; i++) {
    if (categories[i].name == categoryName) {
      indexCategory = i;
    }
  }
  return indexCategory;
}
