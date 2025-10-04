import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    @required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] ?? 0).toDouble(), // 👈 fallback لو مفيش rate
      count: (json['count'] ?? 0).toInt(), // 👈 fallback لو مفيش count
    );
  }
}
