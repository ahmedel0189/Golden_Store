class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final String category;
  final String image;
  final Map<String, dynamic> rating;


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromjson(
    Map<String, dynamic> json,
  ) {
    return ProductModel(
      id:json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Map<String, dynamic>.from(json['rating']),
    );
  }
}
