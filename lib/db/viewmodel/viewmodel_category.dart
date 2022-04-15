/*
 * Created by Nguyen Kim Khanh on 4/13/22, 9:44 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 9:44 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:groshop/db/repo_category_impl.dart';
import 'package:groshop/db/repository/repository_category.dart';
import 'package:groshop/models/category.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewModelCategory extends Model {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  RepositoryCategory repositoryCategory = RepositoryCategoryImpl();

  ViewModelCategory() {
    getCategories();
  }

  void getCategories() async {
    _categories = await repositoryCategory.getCategories();
    notifyListeners();
  }
}
