import 'package:flutter/material.dart';
import 'package:golden_store/layers/ui/Widgets/widgets_of_products.dart';

class HomaePage extends StatelessWidget {
  const HomaePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'New Trends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: WidgetsOfProducts.futureGridBuilder(),
    );
  }
}
