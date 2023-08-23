import 'package:afisha_market/core/bloc/home/home_bloc.dart';
import 'package:afisha_market/core/data/repository/product_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/GetProfileResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/ProductResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepository;

  ProductDetailBloc(this._productRepository)
      : super(const ProductDetailState()) {
    on<ProductDetailInitEvent>((event, emit) => {});
    on<ProductDetailDataEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        final response = await _productRepository.getProduct(event.id);
        response.when(
          success: (data) {
            var list = <Product>[];
            list.add(data);
            emit(state.copyWith(status: Status.success, product: list));
          },
          failure: (failure) {},
        );

      } catch (e) {}
    });
  }
}
