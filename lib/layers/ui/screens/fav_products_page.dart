import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_store/layers/data/api/all_products_api.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:golden_store/layers/data/repo/all_products_repo.dart';
import 'package:golden_store/layers/domain/logic/cubit/products_cubit.dart';
import 'package:golden_store/layers/ui/Widgets/widgets_of_products.dart';

class FavProductsPage extends StatefulWidget {
  const FavProductsPage({super.key});

  @override
  State<FavProductsPage> createState() =>
      _FavProductsPageState();
}

class _FavProductsPageState
    extends State<FavProductsPage> {
  late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    final repo = AllProductsRepositories(
      allProductsApi: AllProductsApi(),
    );
    _productsFuture = repo
        .getallProducts(); // fetch only ONCE
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Align(
            child: Text(
              'Favorites',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ProductModel>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child:
                        CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                    ),
                  );
                }
                if (!snapshot.hasData ||
                    snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      "No products found",
                    ),
                  );
                }
                // Get the list of liked products
                final likedProducts = context
                    .read<ProductsCubit>()
                    .getLikedProducts(
                      snapshot.data!,
                    );
                // Show message if no liked products
                if (likedProducts.isEmpty) {
                  return const Center(
                    child: Text(
                      "Add your favorites 😍",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  );
                } // pass the actual list
                return WidgetsOfProducts.productsGrid(
                  products: likedProducts,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
