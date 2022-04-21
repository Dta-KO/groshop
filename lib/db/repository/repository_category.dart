/*
 * Created by Nguyen Kim Khanh on 4/13/22, 8:44 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 8:44 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:groshop/models/category.dart';

abstract class RepositoryCategory {
  Future<Category> getCategoryByName(String name);

  Future<List<Category>> getCategories();

  Future<List<Category>> getSubCategoriesByName(String name);

  Future<void> removeCategory(Category category);
}
