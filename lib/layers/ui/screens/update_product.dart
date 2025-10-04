// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:golden_store/constants/my_strings.dart';
import 'package:golden_store/layers/data/api/update_product_api.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:golden_store/layers/ui/Widgets/my_elevated_buttom.dart';
import 'package:golden_store/layers/ui/Widgets/my_text_field.dart';

class UpdateProduct extends StatefulWidget {
  final ProductModel selectedProduct;

  const UpdateProduct({super.key, required this.selectedProduct});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, description, price, imageUrl;

  // Controllers for all fields
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(
                    labelText: 'Product Name',
                    hintText: 'Enter product name',
                    controller: nameController,
                    prefixIcon: Icons.shopping_bag,
                    onChanged: (productName) {
                      productName = nameController.text;
                    },
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Description',
                    hintText: 'Enter product description',
                    controller: descriptionController,
                    prefixIcon: Icons.description,
                    onChanged: (description) {
                      description = descriptionController.text;
                    },
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Price',
                    hintText: 'Enter price',
                    controller: priceController,
                    prefixIcon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    onChanged: (price) {
                      price = priceController.text;
                    },
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Image URL',
                    hintText: 'Enter image link',
                    controller: imageController,
                    prefixIcon: Icons.image,
                    keyboardType: TextInputType.url,
                    onChanged: (imageURL) {
                      imageURL = imageController.text;
                    },
                  ),
                  const SizedBox(height: 30),
                  MyElevatedButton(
                    text: 'Update Product',
                    onPressed: () async {
                      // 🔹 If any field is empty, keep the old value from selectedProduct
                      final String updatedName = nameController.text.isEmpty
                          ? widget.selectedProduct.title
                          : nameController.text;

                      final String updatedDescription =
                          descriptionController.text.isEmpty
                          ? widget.selectedProduct.description
                          : descriptionController.text;

                      final String updatedPrice = priceController.text.isEmpty
                          ? widget.selectedProduct.price.toString()
                          : priceController.text;

                      final String updatedImage = imageController.text.isEmpty
                          ? widget.selectedProduct.image
                          : imageController.text;

                      // 🔹 Call API with either new values or old ones
                      await UpdateProductApi().updateProduct(
                        id: widget.selectedProduct.id,
                        productName: updatedName,
                        price: updatedPrice,
                        description: updatedDescription,
                        image: updatedImage,
                        category: widget.selectedProduct.category,
                      );
                      Navigator.pop(context, MyRoutes.updateProductRoute);

                      // 🔹 Optional: show success message (you can keep or remove)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            '✅ Product updated successfully (local check)',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
