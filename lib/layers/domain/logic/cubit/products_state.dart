part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState(); 
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();

  @override
  List<Object?> get props => [];
}

final class LikedProducts extends ProductsState {
  final Map<int, bool> likedProducts;

  const LikedProducts(this.likedProducts);

  @override
  List<Object?> get props => [likedProducts];
}
