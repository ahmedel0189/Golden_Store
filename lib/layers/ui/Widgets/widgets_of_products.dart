import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:golden_store/layers/data/api/all_products_api.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:golden_store/layers/data/repo/all_products_repo.dart';

class WidgetsOfProducts {
  static Widget futureGridBuilder() {
    final AllProductsApi allProductsApi =
        AllProductsApi();
    final AllProductsRepositories
    allProductsRepo = AllProductsRepositories(
      allProductsApi: allProductsApi,
    );
    Future<List<ProductModel>> products =
        allProductsRepo.getallProducts();

    return FutureBuilder<List<ProductModel>>(
      future: products,
      builder: (context, snapshot) {
        // حالة الـ Loading
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // حالة الـ Error
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
            ),
          );
        } // حالة البيانات الجاهزة
        if (snapshot.hasData) {
          final products = snapshot.data!;
          return WidgetsOfProducts.productsGrid(
            products: products,
          );
        }

        // fallback
        return const Center(
          child: Text("No products found"),
        );
      },
    );
  }

  static Widget productsGrid({
    required List<ProductModel> products,
  }) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      physics:
          const BouncingScrollPhysics(), // scroll ناعم
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // كام عمود
            crossAxisSpacing:
                16, // مسافة بين الأعمدة
            mainAxisSpacing:
                16, // مسافة بين الصفوف
            childAspectRatio:
                0.75, // نسبة الطول للعرض
          ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return productCard(
          productModel: products[index],
          onpressed: () {},
        );
      },
    );
  }

  static Widget productCard({
    required ProductModel productModel,
    required VoidCallback onpressed,
  }) {
    return SizedBox(
      height: 220, // الطول الكلي للكارد
      child: Stack(
        clipBehavior: Clip
            .none, // عشان الصورة تطلع برا الكارد
        children: [
          // الكارد الأساسي
          Container(
            margin: const EdgeInsets.only(
              top: 60,
            ), // يدي مساحة للصورة فوق
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: 0.1,
                  ),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    productModel.title,
                    maxLines:
                        2, // 👈 يمنع الـ overflow
                    overflow: TextOverflow
                        .ellipsis, // 👈 يضيف "..."
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        '${productModel.price} \$',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: onpressed,
                        icon: Icon(
                          FontAwesomeIcons
                              .solidHeart,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // الصورة طالعة فوق الكارد
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
  }
}
