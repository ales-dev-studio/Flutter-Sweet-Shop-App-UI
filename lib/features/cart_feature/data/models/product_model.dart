class ProductModel {
  final int id;
  final String name;
  final double price;
  final double weight;
  final double rate;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.rate,
    required this.imageUrl,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    double? price,
    double? weight,
    double? rate,
    String? imageUrl,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      rate: rate ?? this.rate,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
