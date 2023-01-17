import 'dart:convert';

import 'package:botomyfluttertask/model/productmodel.dart';

class CategoryModel {
  int? prize;
  String? categoryname;
  int? category_id;
  List<Product>? product;
  CategoryModel({this.categoryname, this.product,this.category_id,this.prize});
  factory CategoryModel.fromJson(Map<String, dynamic> response) {
    return CategoryModel(
      categoryname: response['category_name'],
      product: response["products"] == null
          ? []
          : List<Product>.from(
              response["products"]!.map((x) => Product.fromJson(x))),
      category_id: response['category_id'],
    );
  }
}
