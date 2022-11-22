class CategoryItem {
  int id;
  String name;
  String imageUrl;
  CategoryItem({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
        id: json['id'] ?? 0,
        imageUrl: json['imageUrl'] ?? "",
        name: json['name'] ?? ""
    );
  }

}
