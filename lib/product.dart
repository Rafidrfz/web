class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final int stock;
  final String brand;
  final String thumbnail;
  final List<String> images;
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.brand,
    required this.thumbnail,
    required this.images,
  });
  factory Product.fromJson(dynamic json) {
    List<String>? images =
        json['images'] != null ? List.from(json['images']) : null;

    return Product(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        stock: json['stock'] as int,
        brand: json['brand'] as String,
        thumbnail: json['thumbnail'] as String,
        images: images!);
  }
}
