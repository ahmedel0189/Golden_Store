import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:golden_store/layers/domain/logic/cubit/products_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        // Read liked products map from cubit
        final likedProducts =
            context.read<ProductsCubit>().likedProducts;

        final isLiked = likedProducts[productModel.id] ?? false;

        return SizedBox(
          height: 220,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Card container
              Container(
                margin: const EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      // Product title
                      Text(
                        productModel.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      // Price + Heart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${productModel.price} \$',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Toggle via cubit
                              context
                                  .read<ProductsCubit>()
                                  .toggleLike(productModel.id);
                            },
                            icon: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: isLiked ? Colors.red : Colors.blueGrey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Product image
              Positioned(
                top: 0,
                left: 50,
                right: 0,
                child: Hero(
                  tag: productModel.image,
                  child: Image.network(
                    productModel.image,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
