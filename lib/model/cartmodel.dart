import 'package:flutter/material.dart';
class CartModel {
  String itemName;
  String itemPrice;
  int itemId;
  int itemCount;

  CartModel(
      {required this.itemCount,
      required this.itemId,
      required this.itemName,
      required this.itemPrice});
}
