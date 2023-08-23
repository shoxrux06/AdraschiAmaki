part of 'product_detail_bloc.dart';

@immutable
class ProductDetailState {
  final List<Product> product;
  final Status status;

  const ProductDetailState({
    this.product = const [],
    this.status = Status.initial,
  });

  ProductDetailState copyWith({
    List<Product>? product,
    Status? status,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }
}
