/*
 * Created by Nguyen Kim Khanh on 4/13/22, 9:44 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 9:44 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:groshop/db/repository/repo_subcategory.dart';
import 'package:groshop/models/category.dart';
import 'package:scoped_model/scoped_model.dart';

import '../repo_sub_category_impl.dart';

class ViewModelSubCategory extends Model {
  List<Category> _categories = [];
  String name;

  List<Category> get subCategories => _categories;
  RepoSubCategory repoSubCategory = RepositorySubCategoryImpl(name: name);


  ViewModelSubCategory({required this.name}) {
    getCategories();
  }

  void getCategories() async {
    _categories = await repoSubCategory.getSubCategories();
    notifyListeners();
  }
}
