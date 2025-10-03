import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;
import 'package:golden_store/layers/data/models/product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel productModel;  // product data
  final bool initialLiked;          // starting liked state (from parent)
  final VoidCallback onPressed;     // callback to notify parent

  const ProductCard({
    super.key,
    required this.productModel,
    required this.initialLiked,
    required this.onPressed,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isLiked; // local like state for this card

  @override
  void initState() {
    super.initState();
    isLiked = widget.initialLiked; // set initial value
  }

  @override
  void didUpdateWidget(covariant ProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Keep the local state in sync when parent updates
    if (oldWidget.initialLiked != widget.initialLiked) {
      isLiked = widget.initialLiked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        clipBehavior: Clip.none, // allow image to go outside
        children: [
          // Product card container
          Container(
            margin: const EdgeInsets.only(top: 60), // space for image
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
                    widget.productModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // Price + Heart icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.productModel.price} \$',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // update local UI
                          setState(() {
                            isLiked = !isLiked;
                          });
                          // notify parent
                          widget.onPressed();
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
          // Product image (on top of card)
          Positioned(
            top: 0,
            left: 50,
            right: 0,
            child: Hero(
              tag: widget.productModel.image,
              child: Image.network(
                widget.productModel.image,
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
