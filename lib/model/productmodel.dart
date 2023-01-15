import 'package:botomyfluttertask/model/productimagemodel.dart';

class Product {
  String kitchen_item_name;
  int kitchen_item_amount;


  List<Kitchenitemimage>? kitchenitemimage;
  int kitchen_item_id;

  Product({
    required this.kitchen_item_name,
    required this.kitchen_item_amount,
    this.kitchenitemimage,
    required this.kitchen_item_id,

    // List<>
  });
  factory Product.fromJson(Map<String, dynamic> response) {
    return Product(
      kitchen_item_name: response['kitchen_item_name'],
      kitchen_item_amount: response['kitchen_item_amount'],
      kitchenitemimage: response["images"] == null
          ? []
          : List<Kitchenitemimage>.from(
              response["images"]!.map((x) => Product.fromJson(x))),
      kitchen_item_id: response['kitchen_item_id']
    );
  }
}
