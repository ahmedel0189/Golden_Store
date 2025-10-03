import 'package:flutter/material.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:golden_store/layers/ui/Widgets/product_card.dart';

class WidgetsOfProducts {
  // Only builds the grid (no FutureBuilder now)
  static Widget productsGrid({
    required List<ProductModel> products,
    required Map<int, bool> likedProducts,
    required Function(int) onToggleLike,
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
        final isLiked = likedProducts[product.id] ?? false;

        return ProductCard(
          productModel: product,
          initialLiked: isLiked,
          onPressed: () => onToggleLike(product.id),
        );
      },
    );
  }
}
