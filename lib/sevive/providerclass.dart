import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/cartmodel.dart';
import '../model/categorymodel.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  final List<CategoryModel> _cartitem = <CategoryModel>[

  ];

  List<CategoryModel> get cartitem => _cartitem;

  Future<List<CategoryModel>> Getdish() async {
    var url =
        'https://www.butomy.com/api/getbusinessbytimeline-petpooja-timing?business_type=1&page_id=351&user_id=367&offset=0&products_type=all&placeorder_type=all';
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var body = json.decode(responce.body);
      List<CategoryModel> listData = List<CategoryModel>.from(
          body['data'].map((v) => CategoryModel.fromJson(v))).toList();
      print(listData);
      return listData;
    } else {
      List<CategoryModel> listData = [];
      return listData;
    }
  }

  int incrementProductcount(int? count) {
    count = count! + 1;
    notifyListeners();
    return count;

  }

  int dicrementProductcount(int? count) {
    count = count! + 1;
    notifyListeners();
    return count;

  }



  void addtocart(CategoryModel categoryModel){
_cartitem.add(categoryModel);
notifyListeners();
  }


}
