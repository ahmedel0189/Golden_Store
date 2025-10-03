import 'package:flutter/material.dart';
import 'package:golden_store/layers/data/api/all_products_api.dart';
import 'package:golden_store/layers/data/repo/all_products_repo.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:golden_store/layers/ui/Widgets/widgets_of_products.dart';
import 'package:golden_store/layers/ui/Widgets/drawer_of_the_homa_page.dart'; // import your drawer

class HomaePage extends StatefulWidget {
  const HomaePage({super.key});

  @override
  State<HomaePage> createState() => _HomaePageState();
}

class _HomaePageState extends State<HomaePage> {
  late Future<List<ProductModel>> _productsFuture; // store future once

  @override
  void initState() {
    super.initState();
    final repo = AllProductsRepositories(
      allProductsApi: AllProductsApi(),
    );
    _productsFuture = repo.getallProducts(); // fetch only ONCE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          'New Trends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        // open drawer when menu icon pressed
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const DrawerOfTheHomaPage(), // attach your drawer here
      body: FutureBuilder<List<ProductModel>>(
        future: _productsFuture, // use the stored future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
              ),
            );
          }
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return WidgetsOfProducts.productsGrid(
              products: products,
            );
          }
          return const Center(
            child: Text("No products found"),
          );
        },
      ),
    );
  }
}
