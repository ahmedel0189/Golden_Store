// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:golden_store/layers/ui/Widgets/my_elevated_buttom.dart';
import 'package:golden_store/layers/ui/Widgets/my_text_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() =>
      _AddProductPageState();
}

class _AddProductPageState
    extends State<AddProductPage> {
  // Controllers for all fields
  final nameController = TextEditingController();
  final descriptionController =
      TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  final categoryController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Add Product',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 50),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(
                    labelText: 'Product Name',
                    hintText:
                        'Enter product name',
                    controller: nameController,
                    prefixIcon:
                        Icons.shopping_bag,
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Description',
                    hintText:
                        'Enter product description',
                    controller:
                        descriptionController,
                    prefixIcon: Icons.description,
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Price',
                    hintText: 'Enter price',
                    controller: priceController,
                    prefixIcon:
                        Icons.attach_money,
                    keyboardType:
                        TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Image URL',
                    hintText: 'Enter image link',
                    controller: imageController,
                    prefixIcon: Icons.image,
                    keyboardType:
                        TextInputType.url,
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    labelText: 'Category',
                    hintText:
                        'Enter product category',
                    controller:
                        categoryController,
                    prefixIcon: Icons.category,
                  ),
                  const SizedBox(height: 30),
                  MyElevatedButton(
                    text: 'Add Product',
                    onPressed: () {},
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
