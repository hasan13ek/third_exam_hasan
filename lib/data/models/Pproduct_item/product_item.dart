class ProductItem {
  int id;
  int categoryId;
  String name;
  int price;
  String imageUrl;
  ProductItem({
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.categoryId,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
        id: json['id'],
        price: json["price"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        categoryId: json["categoryId"],
    );
  }
}
