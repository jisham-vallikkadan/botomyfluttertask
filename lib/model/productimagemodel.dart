class Kitchenitemimage {
  String? pimage;
  Kitchenitemimage({this.pimage});
  factory Kitchenitemimage.fromJson(Map<String, dynamic> response) {
    return Kitchenitemimage(pimage: response['images']);
  }
}
