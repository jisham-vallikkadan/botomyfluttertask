import 'package:flutter/material.dart';
class CartModel {
  String itemName;
  int itemPrice;
  int itemId;
  int? itemCount;
  int? toatalamount;

  CartModel(
      { this.itemCount,
      required this.itemId,
      required this.itemName,
      required this.itemPrice,
       this.toatalamount});
}
