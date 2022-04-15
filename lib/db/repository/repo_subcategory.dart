/*
 * Created by Nguyen Kim Khanh on 4/14/22, 3:56 PM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/14/22, 3:56 PM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:groshop/models/category.dart';

abstract class RepoSubCategory {
  Future<Category> getSubCategoryByName(String name);

  Future<List<Category>> getSubCategories();

  Future<void> removeSubCategory(Category category);
}
