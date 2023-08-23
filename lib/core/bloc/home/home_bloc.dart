import 'package:afisha_market/core/data/repository/home_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/AdvertisementResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/ProductResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/RegionResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/material_type_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/filter_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  final FilterRepository _filterRepository;
  HomeBloc(this._homeRepository, this._filterRepository) : super(HomeState()) {
    on<HomeInitEvent>((event, emit) async {
      emit(
        state.copyWith(
          isFetchingAds: true,
          isFetchingProducts: true,
          isFetchingRegions: true,
        ),
      );
      try {
        final productResponse = await _homeRepository.getProductList();
        final adsResponse = await _homeRepository.getAds();
        final viewResponse = await _homeRepository.getViews();

        productResponse.when(
          success: (data) {
            emit(
              state.copyWith(
                status: Status.success,
                productList: data.data.item,
                currentPage: data.data.meta.currentPage,
                isFetchingProducts: false,
                lastPage: data.data.meta.lastPage,
              ),
            );
          },
          failure: (failure) {
            emit(state.copyWith(isFetchingProducts: false));
          },
        );

        adsResponse.when(success: (data) {
          emit(
            state.copyWith(status: Status.success, adList: data.data, isFetchingAds: false),
          );
        }, failure: (failure) {
          emit(state.copyWith(isFetchingAds: false));
        });

        viewResponse.when(
            success: (data) {
              emit(
                state.copyWith(
                  status: Status.success,
                  viewCount: data,
                ),
              );
            },
            failure: (failure) {});
      } catch (e) {
        emit(state.copyWith(isFetchingRegions: false));
      }
    });

    on<HomeNextEvent>((event, emit) async {
      if (state.currentPage < state.lastPage) {
        emit(state.copyWith(status: Status.loading));
        try {
          final productResponse = await _homeRepository.getProductList(page: state.currentPage + 1);
          productResponse.when(
              success: (data) {
                emit(
                  state.copyWith(
                    status: Status.success,
                    productList: [...state.productList, ...data.data.item],
                    currentPage: data.data.meta.currentPage,
                  ),
                );
              },
              failure: (failure) {});
        } catch (e) {}
      } else {
        emit(state.copyWith(status: Status.success));
      }
    });

    on<HomeGetMaterialTypes>((event, emit) async {
      emit(state.copyWith(isFetchingFilteredProducts: true));
      try {
        final response = await _filterRepository.getProductByMaterialType();
        response.when(success: (data) {
          emit(state.copyWith(
            status: Status.success,
            isFetchingFilteredProducts: false,
            materialTypeResponse: data,
            currentPage: 0,
            lastPage: 1,
          ));
        }, failure: (failure) {
          emit(state.copyWith(status: Status.fail,isFetchingFilteredProducts: false,));
        });
      } catch (e) {
        emit(state.copyWith(
          status: Status.fail,
          isFetchingFilteredProducts: false,
        ));
      }
    });

    on<HomeSearchEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading, search: event.text));
      try {
        final productResponse = await _homeRepository.getProductList(search: event.text);
        productResponse.when(
            success: (data) {
              emit(
                state.copyWith(
                  status: Status.success,
                  productList: data.data.item,
                  adList: state.adList,
                  currentPage: data.data.meta.currentPage,
                  lastPage: data.data.meta.lastPage,
                ),
              );
            },
            failure: (failure) {});
      } catch (e) {}
    });

    on<HomeFilterProductsByMaterialTypes>((event, emit) async {
      emit(state.copyWith(status: Status.loading,));
      try {
        final productResponse = await _homeRepository.getProductList();
        productResponse.when(
            success: (data) {
              List<Product> newProductList = data.data.item.where((product) => product.mahsulotTola == event.materialType).toList();
              emit(
                state.copyWith(
                  status: Status.success,
                  productList: newProductList,
                  adList: state.adList,
                  currentPage: data.data.meta.currentPage,
                  lastPage: data.data.meta.lastPage,
                ),
              );
            },
            failure: (failure) {});
      } catch (e) {}
    });
  }
}
