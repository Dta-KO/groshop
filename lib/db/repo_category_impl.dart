/*
 * Created by Nguyen Kim Khanh on 4/13/22, 9:47 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 9:47 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groshop/db/repository/repository_category.dart';
import 'package:groshop/models/category.dart';
import 'package:groshop/utils/constants.dart';

class RepositoryCategoryImpl with RepositoryCategory {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Category>> getCategories() async {
    final categoriesRef = firestore
        .collection(Constants.vi)
        .doc(Constants.category)
        .collection(Constants.root)
        .withConverter<Category>(
          fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
          toFirestore: (category, _) => category.toJson(),
        );

    List<DocumentSnapshot<Category>> categoriesSnapshot =
        await categoriesRef.get().then((value) => value.docs);

    List<Category> categories = [];
    categoriesSnapshot.forEach((element) {
      categories.add(element.data()!);
    });

    return categories;
  }

  @override
  Future<Category> getCategoryByName(String name) async {
    // TODO: implement getCategoryByName
    throw UnimplementedError();
  }

  @override
  Future<void> removeCategory(Category category) {
    // TODO: implement removeCategory
    throw UnimplementedError();
  }
}
