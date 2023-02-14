import 'package:botomyfluttertask/model/productimagemodel.dart';

class Product {
  // List<Count>?cc;
  String kitchen_item_name;
  int kitchen_item_amount;
  List<Kitchenitemimage> kitchenitemimage;
  int kitchen_item_id;
  int? products_status;
  int? item_discount_price;
  int? count;

  Product({
    required this.kitchen_item_name,
    required this.kitchen_item_amount,
    required this.kitchenitemimage,
    required this.kitchen_item_id,
    this.products_status,
    this.item_discount_price,
    this.count=0,

    // this.cc,
  });
  factory Product.fromJson(Map<String, dynamic> response) {
    return Product(
        kitchen_item_name: response['kitchen_item_name'],
        kitchen_item_amount: response['kitchen_item_amount'],
        kitchenitemimage: response['kitchen_item_image'] == null
            ? []
            : List<Kitchenitemimage>.from(response['kitchen_item_image']!
                .map((x) => Kitchenitemimage.fromJson(x))),
        kitchen_item_id: response['kitchen_item_id'],
        products_status: response['products_status'],
        item_discount_price: response['item_discount_price']);
  }
}

// class Count{
//   int? itemcount;
//   Count({
//     this.itemcount
// });
// }
