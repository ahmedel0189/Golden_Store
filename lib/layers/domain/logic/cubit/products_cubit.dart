import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsInitial());

  // Map to store liked products (by id)
  final Map<int, bool> _likedProducts = {};

  // Getter to expose liked products (immutable copy)
  Map<int, bool> get likedProducts => Map.unmodifiable(_likedProducts);

  // Toggle like/unlike for a product
  void toggleLike(int productId) {
    final current = _likedProducts[productId] ?? false;
    _likedProducts[productId] = !current;

    // Emit updated state
    emit(LikedProducts(Map.from(_likedProducts)));
  }

  // Reset all liked products
  void resetLikes() {
    _likedProducts.clear();
    emit(LikedProducts(Map.from(_likedProducts)));
  }
}
