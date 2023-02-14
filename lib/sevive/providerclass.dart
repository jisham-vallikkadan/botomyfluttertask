import 'dart:convert';

import 'package:botomyfluttertask/model/productmodel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/cartmodel.dart';
import '../model/categorymodel.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  final List<CartModel> _cartitem = <CartModel>[];

  List<CartModel> get cartitem => _cartitem;

  List<CategoryModel> _dish = <CategoryModel>[];

  List<CategoryModel> get dish => _dish;

  int itemCount = 0;

  Future Getdish() async {
    var url =
        'https://www.butomy.com/api/getbusinessbytimeline-petpooja-timing?business_type=1&page_id=351&user_id=367&offset=0&products_type=all&placeorder_type=all';
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var body = json.decode(responce.body);
      List<CategoryModel> listData = List<CategoryModel>.from(
          body['data'].map((v) => CategoryModel.fromJson(v))).toList();

      _dish = listData;
      print(dish);
      notifyListeners();
    } else {}
  }

  void clearcart(CartModel cartModel) {
    _cartitem.clear();
    notifyListeners();
  }

  notifyListeners();
}
