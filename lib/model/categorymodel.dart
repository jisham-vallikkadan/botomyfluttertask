import 'dart:convert';

import 'package:botomyfluttertask/model/productmodel.dart';

class CategoryModel {
  String? categoryname;
  List<Product>? product;
  CategoryModel({this.categoryname, this.product});
  factory CategoryModel.fromJson(Map<String, dynamic> response) {
    return CategoryModel(
      categoryname: response['category_name'],
      product: response["products"] == null
          ? []
          : List<Product>.from(
              response["products"]!.map((x) => Product.fromJson(x))),
    );
  }
}
