import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:golden_store/layers/data/models/product_model.dart';
import 'package:hive/hive.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final Box myBox;

  ProductsCubit({required this.myBox})
    : super(const ProductsInitial()) {
    _loadLikedProducts();
  }

  // Map to store liked products (by id)
  final Map<int, bool> _likedProducts = {};

  // Getter to expose liked products (immutable copy)
  Map<int, bool> get likedProducts =>
      Map.unmodifiable(_likedProducts);

  // ------------------------------
  // Hive-related methods
  // ------------------------------

  /// Initialize liked products from Hive
  void _loadLikedProducts() {
    final savedList = myBox.get(
      "LikedProductsList",
      defaultValue: <int>[],
    );
    _likedProducts.clear();
    for (var id in savedList) {
      _likedProducts[id] = true;
    }
    emit(LikedProducts(Map.from(_likedProducts)));
  }

  /// Save the current liked products to Hive
  void _saveLikedProducts() {
    final likedIds = _likedProducts.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();
    myBox.put("LikedProductsList", likedIds);
  }

  // ------------------------------
  // Cubit methods
  // ------------------------------

  /// Toggle like/unlike for a product
  void toggleLike(int productId) {
    final current =
        _likedProducts[productId] ?? false;
    _likedProducts[productId] = !current;

    _saveLikedProducts(); // save immediately

    emit(LikedProducts(Map.from(_likedProducts)));
  }

  /// Reset all likes
  void resetLikes() {
    _likedProducts.clear();
    _saveLikedProducts();
    emit(LikedProducts(Map.from(_likedProducts)));
  }

  /// Get only liked products from a list
  List<ProductModel> getLikedProducts(
    List<ProductModel> allProducts,
  ) {
    return allProducts
        .where(
          (product) =>
              _likedProducts[product.id] == true,
        )
        .toList();
  }
}
