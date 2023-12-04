import 'dart:convert';

import 'package:advanc_task_6/models/product.model.dart';
import 'package:flutter/services.dart';

class DataSeeder {
  static Map _data = {};

  static List<Product> products = [];

  static Future<List<Product>> loadData() async {
    // await Future.delayed(const Duration(seconds: 5));
    var response = await rootBundle.loadString('assets/data.json');
    _data = jsonDecode(response);

    products =
        (_data['products'] as List).map((e) => Product.fromJson(e)).toList();
    return products;
  }
}
