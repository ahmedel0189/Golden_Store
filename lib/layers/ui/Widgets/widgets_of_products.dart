import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import 'product_card.dart';

class WidgetsOfProducts {
  // Builds the product grid using Cubit (ProductCard handles likes itself)
  static Widget productsGrid({
    required List<ProductModel> products,
  }) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(productModel: product);
      },
    );
  }
}
