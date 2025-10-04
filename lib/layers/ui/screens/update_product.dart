// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:golden_store/layers/ui/Widgets/my_elevated_buttom.dart';
import 'package:golden_store/layers/ui/Widgets/my_text_field.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() =>
      _UpdateProductState();
}

class _UpdateProductState
    extends State<UpdateProduct> {
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
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Update Product',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
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
                  const SizedBox(height: 30),
                  MyElevatedButton(
                    text: 'Update Product',
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
