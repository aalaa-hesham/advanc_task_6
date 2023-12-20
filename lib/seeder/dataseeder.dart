import 'dart:convert';

import 'package:advanc_task_6/models/ads_model.dart';
import 'package:advanc_task_6/models/categories_model.dart';
import 'package:advanc_task_6/models/products_model.dart';
import 'package:flutter/services.dart';

class DataSeeder {
  static Map _data = {};

  static List<Product> products = [];
  static List<CategoryData> categories = [];
  static List<Ads> ads = [];

  static Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    var response = await rootBundle.loadString('assets/data.json');
    _data = jsonDecode(response);
    products =
        (_data['products'] as List).map((e) => Product.fromJson(e)).toList();

    categories = (_data['categories'] as List)
        .map((e) => CategoryData.fromJson(e))
        .toList();
    ads = (_data['ads'] as List).map((e) => Ads.fromJson(e)).toList();
  }
}
