import 'package:flutter/material.dart';
import 'package:groshop/Components/drawer.dart';
import 'package:groshop/Pages/Search/search_history.dart';
import 'package:groshop/db/viewmodel/viewmodel_sub_category.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../widgets/products/products_ui.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final username =
        ScopedModel.of<ViewModelSubCategory>(context, rebuildOnChange: true).subCategories;
    // final counter =
    //     ScopedModel.of<CounterModel>(context, rebuildOnChange: true).counter;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(height: 12.0),
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
              padding: EdgeInsets.only(top: 100),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  buildCompleteProductsVerticalList(
                      context, products, "Gần bạn"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Giảm giá"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Giặt chăm, drap, mền"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Giặt đồ baby, nhạy cảm"),
                  buildCompleteProductsVerticalList(context, products2,
                      "Giặt gấu bông, giặt giày, túi xách, vali, balo"),
                  buildCompleteProductsVerticalList(
                      context, products, "Giặt hấp, vest, áo dài, đầm"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Giặt sấy tổng hợp"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Giặt ướt"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Sấy khô, sấy thơm"),
                  buildCompleteProductsVerticalList(
                      context, products2, "Dịch vụ khác"),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
