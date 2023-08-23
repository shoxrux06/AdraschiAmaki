part of 'home_bloc.dart';

@immutable
class HomeState {
  final Status status;
  final String message;
  final String search;
  final List<Product> productList;
  final List<Region> regionList;
  final List<AdvItem> adList;
  final int currentPage;
  final int lastPage;
  final int viewCount;
  final bool isFetchingProducts;
  final bool isFetchingFilteredProducts;
  final bool isFetchingRegions;
  final bool isFetchingAds;
  final MaterialTypeResponse? materialTypeResponse;

  HomeState({
    this.productList = const [],
    this.adList = const [],
    this.regionList = const [],
    this.search = "",
    this.status = Status.initial,
    this.message = "",
    this.currentPage = 0,
    this.lastPage = 0,
    this.viewCount = 0,
    this.isFetchingProducts = false,
    this.isFetchingFilteredProducts = false,
    this.isFetchingRegions = false,
    this.isFetchingAds = false,
    this.materialTypeResponse,
  });

  HomeState copyWith({
    Status? status,
    String? message,
    String? search,
    List<Product>? productList,
    List<Region>? regionList,
    List<AdvItem>? adList,
    int? currentPage,
    int? lastPage,
    int? viewCount,
    bool? isFetchingProducts,
    bool? isFetchingFilteredProducts,
    bool? isFetchingRegions,
    bool? isFetchingAds,
    MaterialTypeResponse? materialTypeResponse,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      search: search ?? this.search,
      productList: productList ?? this.productList,
      regionList: regionList ?? this.regionList,
      adList: adList ?? this.adList,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      viewCount: viewCount ?? this.viewCount,
      isFetchingProducts: isFetchingProducts??this.isFetchingProducts,
      isFetchingFilteredProducts: isFetchingFilteredProducts??this.isFetchingFilteredProducts,
      isFetchingRegions: isFetchingRegions??this.isFetchingRegions,
      isFetchingAds: isFetchingAds??this.isFetchingAds,
      materialTypeResponse: materialTypeResponse??this.materialTypeResponse,
    );
  }
}

enum Status { initial, loading, success, fail }
