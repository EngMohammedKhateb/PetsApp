import 'dart:convert';

import '../models/category.dart';
import '../repositories/api_status.dart';
import '../repositories/category_repo.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  // declare variables

  bool _loading = false;
  List<Category>? _categories;

  //getters
  bool get loading => _loading;
  List<Category>? get categories => _categories;

  //setters

  void setLoading(bool loading) {
    _loading = loading;
  }

  getCategories() async {
    var response = await CategoryServices.getCategories();
    if (response is Success) {
      List<dynamic> body = jsonDecode(response.data);

      _categories = body
          .map(
            (dynamic item) => Category.fromJson(item),
          )
          .toList();
    } else {}
  }
}
